/* A4Q2: Are there any specific days where another device type generates
more views than the device from the answer above? */

SELECT
  "date",
  SUM(num_views) as num_views,
  device_type
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date",
  device_type
ORDER BY
  "date",
  num_views DESC;

/* ANSWER: From the returned values we can see that mobile takes over desktop
on 2019-03-04, 2019-03-05, 2019-03-07 and numerous other days. */
