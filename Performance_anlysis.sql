
--Q1 Which venue did Sai Sudharsan score the highest number of runs in during IPL 2026?
SELECT venue, SUM("runs") AS total_runs
FROM cricket
GROUP BY venue
ORDER BY total_runs DESC
LIMIT 1;
--Q2 How did Sai Sudharsan's batting average and strike rate vary across different pitch types?
SELECT pitch_type,
    ROUND(AVG(runs), 2) AS batting_average,
    ROUND(AVG(strikerate), 2) AS average_strikerate
FROM cricket
GROUP BY pitch_type
ORDER BY batting_average DESC;
--Q3 Did Sai Sudharsan perform better in the first innings or the second innings?
SELECT innings,
    COUNT(*) AS matches,
    SUM(runs) AS total_runs,
    ROUND(AVG(runs), 2) AS average_runs,
    MAX(runs) AS highest_score,
    ROUND(AVG(strikerate), 2) AS average_strikerate
FROM cricket
GROUP BY innings
ORDER BY innings;
--Q4 Against which bowling type was Sai Sudharsan dismissed most frequently?
SELECT bowling_type,
    COUNT(*) AS times_dismissed
FROM cricket
WHERE dismissed != 'Not out'
GROUP BY bowling_type
ORDER BY times_dismissed DESC
LIMIT 1;
--Q5 Which ball length resulted in the highest number of dismissals for Sai Sudharsan?
SELECT length,
    COUNT(*) AS times_dismissed
FROM cricket
WHERE dismissed != 'Not out'
GROUP BY length
ORDER BY times_dismissed DESC
LIMIT 1;
--Q6 In which over of the innings was Sai Sudharsan dismissed most often?
SELECT match_over,
    COUNT(*) AS times_dismissed
FROM cricket
WHERE dismissed != 'Not out'
GROUP BY match_over
ORDER BY times_dismissed DESC
LIMIT 1;
--Q7 How did Sai Sudharsan perform against different opponents in terms of total runs, average, and strike rate?
SELECT opponent,
    SUM(runs) AS total_runs,
    ROUND(AVG(runs), 2) AS average_runs,
    ROUND(AVG(strikerate), 2) AS average_strikerate
FROM cricket
GROUP BY opponent
ORDER BY total_runs DESC;
--Q8 During which bowler's spell was Sai Sudharsan dismissed most frequently?
SELECT "bowler_over",
    COUNT(*) AS times_dismissed
FROM cricket
WHERE dismissed != 'Not out'
GROUP BY "bowler_over"
ORDER BY times_dismissed DESC
LIMIT 1;
--Q9 Which factors had the greatest impact on Sai Sudharsan's dismissals during IPL 2026?
SELECT
    "bowling_type",
    "length",
    "bowl_speed",
    "match_over",
    "bowler_over",
    COUNT(*) AS dismissals
FROM cricket
WHERE dismissed != 'Not out'
GROUP BY
    "bowling_type",
    "length",
    "bowl_speed",
    "match_over",
    "bowler_over"
ORDER BY dismissals DESC;
--Q10 What tactical recommendations can be made to bowlers based on Sai Sudharsan's dismissal patterns?
SELECT
    "bowling_type",
    "length",
    "bowl_speed",
    "match_over",
    COUNT(*) AS dismissals
FROM cricket
WHERE dismissed != 'Not out'
GROUP BY
    "bowling_type",
    "length",
    "bowl_speed",
    "match_over"
ORDER BY dismissals DESC;