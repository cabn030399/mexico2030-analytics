-- =====================================================
-- Proyecto: Mexico2030 Analytics
-- Script: 001_create_bronze_tables.sql
-- =====================================================

CREATE TABLE `mexico2030analytics.bronze.raw_matches`
(
    ingestion_timestamp TIMESTAMP,
    source STRING,
    payload JSON
);

CREATE TABLE `mexico2030analytics.bronze.raw_rankings`
(
    ingestion_timestamp TIMESTAMP,
    source STRING,
    payload JSON
);

CREATE TABLE `mexico2030analytics.bronze.raw_players`
(
    ingestion_timestamp TIMESTAMP,
    source STRING,
    payload JSON
);
