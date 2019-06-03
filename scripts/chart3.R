chart3 <- function(df) {
  plot <- ggplot(
    bac,
    aes(Percent_Drivers_0_BAC, Percent_Drivers_over_0.08_BAC, text = State)
    ) +

    geom_point() +

    labs(
      title =
        "% of Drivers in Fatal Crashes with 0.00 BAC vs. Over Legal Limit",
      x = "% of Drivers in Fatal Crashes, 0.00 BAC",
      y = "% of Drivers in Fatal Crashes, 0.08+ BAC"
    )
  ggplotly(plot)
}
