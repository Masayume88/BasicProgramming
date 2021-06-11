/* A4Q1: Which device type generates most views? */
SELECT
  device_type,
  SUM(num_views)
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  device_type
ORDER BY
  SUM(num_views) DESC;

/* ANSWER: The device_type "desktop" rakes in most views when looking at the sum. */

/* A4Q2: Are there any specific days where another device type generates more views than the device from the answer above? */
SELECT
  "date",
  SUM(num_views) AS num_views,
  device_type
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date",
  device_type
ORDER BY
  "date",
  num_views DESC;

/* ANSWER: From the returned values we can see that mobile takes over desktop on 2019-03-04, 2019-03-05, 2019-03-07 and numerous other days. */

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

/* ANSWER: We find that quizes have the highest completion rate on desktops, based on the data from the table.

 Since there is not enough data to go on, the why is just a hypothesis. Perhaps desktop users generally commit to longer sessions when compared to mobile and tablet users.
 Desktops are designed for more work to be done on them, while mobile and tablet are not (ergonomically) designed for longer use and long media consumption times.
 The odds may therefore be in favor of desktops when it comes to quiz completion rates. */

/* A4Q4: Which device type has the highest share rate? Why do you think that is? */
SELECT
  device_type,
  ((SUM(num_shares) / SUM(num_views)) * 100) AS share_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  device_type
ORDER BY
  share_rate DESC;

/* ANSWER: The share rate is highest on tablets according to the given data, with ~1.44% of tablet views leading to a  a share of the quiz.

An assumption to make is that the share rate is highest on tablet due to the inherent user experience design on tablets (and mobile phones)
is catered towards sharing via social media. This is in stark contrast to desktop browsing of quizzes where the button size of share options
is smaller and often gets obscured by multiple activities or tabs on the screen(s).

/* A4Q5: Which day had the most views? */
SELECT
  DISTINCT "date",
  SUM(num_views) as total_views
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date"
ORDER BY
  total_views DESC;

/* ANSWER: April 9th, 2019 is the day with most views according to the table data. */

/* A4VQ1: Plot a chart to visualize the number of quizzes from different types of quizzes */
SELECT
  quiz_type,
  SUM(num_questions) as total_num_questions
FROM
  public.quiz_metadata
GROUP BY
  quiz_type
ORDER BY
  total_num_questions DESC;

/* ANSWER (SEE CHART): The personality quiz type scores highest, closely followed by the standard quiz type,
leaving the rest far behind. */

/* A4VQ2: Plot a chart to visualize the total number of views every day. Does the trend look good for us? */
SELECT
  "date",
  SUM(num_views) as total_views
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date"
ORDER BY
  "date";

/* ANSWER: We can observe a steady decline of total views after an upward trend in april.
Not a good development. */

/* A4VQ3: Plot a chart to visualize the total number of views every day but for each device type.
Does this align with what you found in problem 1, question 1 & 2? */
SELECT
  "date",
  SUM(num_views) as total_views,
  device_type
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date",
  device_type
ORDER BY
  "date";

/* ANSWER: The total view results vary from the specific quiz view results from assignment 1, problem 1 & 2.
It's almost a reverse trend in terms of peaks and throughs when comparing num_views per day from quiz_id
2023144 (mobile) and total views per day via mobile. */

/* A4VQ4: Show the different completion and share rates for each device type in a chart.
What is your hypothesis on why there is a difference? */
SELECT
  device_type,
  ROUND(((SUM(num_completes) / SUM(num_views)) * 100)) AS completion_rate,
  ((SUM(num_shares) / SUM(num_views)) * 100) AS share_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  device_type
ORDER BY
  completion_rate DESC

/* ANSWER: The combined answers from non-visual question 3 and 4 serve as hypothesis here */
