-- SQL Project - Data Cleaning for Layoff Data
-- Dataset Source: https://www.kaggle.com/datasets/swaptr/layoffs-2022


-- Let's Preview the raw data
SELECT * 
FROM world_layoffs.layoffs;


-- First, we need to create a staging table to work on and clean the data. This will ensure that the original table remains intact as a backup in case any issues arise.
CREATE TABLE world_layoffs.layoffs_staging 
LIKE world_layoffs.layoffs;

INSERT layoffs_staging 
SELECT * FROM world_layoffs.layoffs;


-- Our Data Cleaning Workflow:
-- 1. Identify and remove duplicates.
-- 2. Standardize data and fix errors
-- 3. Handle NULL values appropriately.
-- 4. Drop unnecessary rows and columns.


