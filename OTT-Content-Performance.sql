select * from ott_viewer
limit 5


# Q1 Identify which streaming platforms are most successful at keeping viewers engaged.
SELECT 
    platform, 
    ROUND(AVG(drop_off_probability)::numeric, 3) AS avg_drop_off_rate,
    COUNT(DISTINCT title) AS total_shows
FROM public.ott_viewer
GROUP BY platform
ORDER BY avg_drop_off_rate ASC



# Q2 Finds the genres that have the highest volume of episodes at risk of viewer churn.

SELECT 
    genre, 
    COUNT(*) AS high_risk_episodes
FROM ott_viewer
WHERE retention_risk = 'high'
GROUP BY genre
ORDER BY high_risk_episodes DESC
LIMIT 5;



# Q3 Tests the impact of the strength of the opening hook on premiere episode retention

SELECT 
hook_strength, 
ROUND(AVG(drop_off_probability)::numeric, 3) AS avg_drop_off_rate
FROM ott_viewer
WHERE episode_number = 1
GROUP BY hook_strength
ORDER BY hook_strength DESC;



#Q4 Understand if complex plots (high cognitive load) cause viewer frustration.

SELECT cognitive_load,
ROUND(AVG(rewind_count), 2) AS avg_rewinds,
ROUND(AVG(drop_off_probability)::numeric, 3) AS avg_drop_off_rate
FROM ott_viewer
GROUP BY cognitive_load 
ORDER BY avg_rewinds DESC;




#Q5 Determine if viewers who skip intros are more likely to finish the episode.

SELECT skip_intro,
ROUND(AVG(avg_watch_percentage), 2) AS avg_completion_rate,
ROUND(AVG(drop_off_probability)::numeric, 3) AS avg_drop_off_rate
FROM ott_viewer 
GROUP BY skip_intro;



#Q6 Find the ideal pacing speed for maximum watch time.

SELECT pacing_score,
ROUND(AVG(avg_watch_percentage), 2) AS avg_watch_pct
FROM ott_viewer
GROUP BY pacing_score
ORDER BY avg_watch_pct DESC;




#Q7 Top 10 Most Retentive Shows

SELECT 
    title, 
    genre,
    ROUND(AVG(avg_watch_percentage), 2) AS avg_completion,
    ROUND(AVG(drop_off_probability)::numeric, 3) AS avg_drop_off_rate
FROM ott_viewer
GROUP BY title, genre
ORDER BY avg_drop_off_rate ASC
LIMIT 10;




# Q8 Analyzes how the combination of dialogue and required focus affects drop-off rates.

SELECT 
    dialogue_density, 
    attention_required,
    COUNT(*) AS episode_count,
    ROUND(AVG(drop_off_probability)::numeric, 3) AS avg_drop_off_rate
FROM ott_Viewer
GROUP BY dialogue_density, attention_required
ORDER BY avg_drop_off_rate DESC;




#Q9 Based on a weighted average of watch time and drop-off risk, what "Grade" does each show deserve?

WITH ShowMetrics AS (
    SELECT 
        title,
        genre,
        -- Calculate a Raw Score (0-100)
        -- Completion is 70% of the weight, Retention (1 - drop_off) is 30%
        AVG((avg_watch_percentage * 0.7) + ((1 - drop_off_probability) * 100 * 0.3)) AS engagement_score
    FROM ott_viewer
    GROUP BY title, genre
)
SELECT 
    title,
    genre,
    ROUND(engagement_score::numeric, 2) AS final_score,
    CASE 
        WHEN engagement_score >= 85 THEN 'A - Must Renew'
        WHEN engagement_score >= 70 THEN 'B - Solid Performer'
        WHEN engagement_score >= 55 THEN 'C - Needs Improvement'
        ELSE 'D - At Risk of Cancellation'
    END AS executive_grade
FROM ShowMetrics
ORDER BY engagement_score DESC;