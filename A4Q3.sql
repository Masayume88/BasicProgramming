/* A4Q3: Which device type has the highest completion rate? Why do you think that is? */
SELECT
  device_type,
  ROUND(((SUM(num_completes) / SUM(num_views)) * 100)) AS completion_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  device_type
ORDER BY
  completion_rate DESC;

/* ANSWER
We find that quizes have the highest completion rate on desktops, based on the data from the table.

Since there is not enough data to go on, the why is just a hypothesis. Perhaps desktop users generally commit to longer sessions when compared to mobile and tablet users.
Desktops are designed for more work to be done on them, while mobile and tablet are not (ergonomically) designed for longer use and long media consumption times.
The odds may therefore be in favor of desktops when it comes to quiz completion rates.*/
