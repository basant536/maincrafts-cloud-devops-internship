const express = require("express");
const { Pool } = require("pg");
const { createClient } = require("redis");

const app = express();
app.use(express.json());

const db = new Pool({
  host: process.env.DB_HOST || "postgres",
  port: parseInt(process.env.DB_PORT || "5432", 10),
  user: process.env.DB_USER || process.env.POSTGRES_USER || "admin",
  password: process.env.DB_PASSWORD || process.env.POSTGRES_PASSWORD,
  database: process.env.DB_NAME || process.env.POSTGRES_DB || "shopdb"
});

db.on("error", (err) => console.error("Postgres error:", err.message));

const redis = createClient({
  url: `redis://${process.env.REDIS_HOST || "redis"}:6379`
});

redis.on("error", (err) => console.error("Redis error:", err.message));

// Simple liveness check (Docker healthcheck + nginx use this)
app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});

// Detailed check (postgres + redis)
app.get("/api/health", async (req, res) => {
  const status = { app: "ok", postgres: "unknown", redis: "unknown" };

  try {
    await db.query("SELECT 1");
    status.postgres = "ok";
  } catch (err) {
    status.postgres = "error";
  }

  try {
    if (!redis.isOpen) await redis.connect();
    await redis.ping();
    status.redis = "ok";
  } catch (err) {
    status.redis = "error";
  }

  const healthy = status.postgres === "ok" && status.redis === "ok";
  res.status(healthy ? 200 : 503).json(status);
});

app.get("/api", (req, res) => {
  res.json({ message: "Task 5 E-Commerce API is running" });
});

const PORT = process.env.APP_PORT || 8080;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Backend listening on port ${PORT}`);
});