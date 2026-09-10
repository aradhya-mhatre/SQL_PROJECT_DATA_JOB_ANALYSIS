WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Business Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL 
    ORDER BY
        salary_year_avg DESC
    LIMIT 10   
)
SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM
    top_paying_jobs
INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;

/* What this tells us

1. SQL and Python dominate.

Both appeared in 5 of the 8 jobs. That's the strongest signal in this dataset.

For a Business Analyst/analytics-oriented career, this suggests:

SQL + Python is a particularly valuable combination for higher-paying analytics roles.

2. Excel is still very relevant.

Excel appeared in 4/8 jobs (50%). Even among these relatively high-paying roles, Excel hasn't disappeared.

This supports the skills you're currently building: Excel + SQL is a good foundation.

3. Tableau is just as common as Excel.

Tableau also appeared in 4/8 jobs.

So the pattern is roughly:

SQL       █████  62.5%
Python    █████  62.5%
Excel     ████   50%
Tableau   ████   50%
R         ██     25%
Looker    ██     25%
 Others    █      12.5% 
 */
 