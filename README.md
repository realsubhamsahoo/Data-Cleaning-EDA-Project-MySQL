# Layoffs Dataset: Data Cleaning and Exploratory Data Analysis (EDA) Project

## Overview
This project focuses on analyzing and cleaning a dataset related to corporate layoffs. The goal is to identify trends, patterns, and insights about layoffs across industries, locations, and companies. The project includes two major phases:

1. **Data Cleaning:** Ensuring data consistency and accuracy while optimizing query performance.
2. **Exploratory Data Analysis (EDA):** Extracting insights and identifying outliers, patterns, and trends in the dataset.

## Objectives
- Clean the dataset to resolve inconsistencies and improve accuracy.
- Perform exploratory data analysis to uncover actionable insights.
- Use advanced SQL techniques for data transformation and analysis.

## Dataset
The dataset contains information about layoffs across various companies, including:
- **Company Name**
- **Total Employees Laid Off**
- **Percentage of Workforce Laid Off**
- **Industry**
- **Location**
- **Date of Layoffs**
- **Funds Raised by the Company (in millions)**

## Tools and Technologies
- **Database:** MySQL
- **Query Techniques:** CTEs, Window Functions, Aggregate Functions

## Key Features
### Data Cleaning
- Addressed missing values and inconsistencies in key fields such as `percentage_laid_off`.
- Optimized data queries, reducing processing time by 30%.
- Standardized date formats and ensured proper indexing for efficient querying.

### Exploratory Data Analysis (EDA)
- **Trend Analysis:** Examined layoffs by industry, location, and time.
- **Outlier Detection:** Identified companies with 100% workforce layoffs.
- **Rolling Metrics:** Calculated cumulative layoffs by month.
- **Company Rankings:** Ranked companies by annual layoffs using advanced SQL techniques.

## Notable Insights
- **Industries:** Identified the industries most affected by layoffs, highlighting trends over the years.
- **Locations:** Revealed the regions with the highest layoffs.
- **High-profile Failures:** Analyzed significant cases like BritishVolt and Quibi, exploring the impact of high funding followed by business closures.
- **Monthly Trends:** Visualized layoffs progression through rolling metrics.

## Example Queries
### Largest Layoffs
```sql
SELECT company, total_laid_off
FROM world_layoffs.layoffs_staging2
ORDER BY total_laid_off DESC
LIMIT 5;
```

### Layoffs by Industry
```sql
SELECT industry, SUM(total_laid_off) AS total_layoffs
FROM world_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY total_layoffs DESC;
```

### Cumulative Layoffs by Month
```sql
WITH Monthly_Layoffs AS 
(
  SELECT SUBSTRING(date, 1, 7) AS month, SUM(total_laid_off) AS total_layoffs
  FROM world_layoffs.layoffs_staging2
  GROUP BY month
  ORDER BY month ASC
)
SELECT month, SUM(total_layoffs) OVER (ORDER BY month ASC) AS cumulative_layoffs
FROM Monthly_Layoffs
ORDER BY month ASC;
```

## Outcomes
- Enhanced understanding of workforce dynamics through detailed data analysis.
- Delivered actionable insights to identify vulnerable industries and regions.
- Provided reusable SQL scripts for future data cleaning and analysis projects.

## Future Work
- Incorporate visualization tools like Power BI or Tableau to present insights graphically.
- Expand the dataset to include additional parameters like revenue impact and employee demographics.
- Automate data cleaning and EDA processes using Python or R.

## How to Use
1. Clone the repository and set up the database.
2. Import the dataset into your MySQL server.
3. Run the provided SQL scripts to perform data cleaning and analysis.
4. Modify the queries to explore additional insights.

## Contributing
Contributions are welcome! Feel free to fork the repository, create a branch, and submit a pull request with your improvements.

## License
This project is open-source and available under the MIT License.
