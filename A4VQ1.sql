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
