# Impaired_Driving_Death_Rate_by_Age_and_Gender_2012_2014_All_States

chart2 <- function(data, year, value) {
  data <- data %>%
    filter("State" != "United States") %>%
    mutate(region = tolower(State))

  data_2014 <- data %>%
    select(
      region, "All.Ages..2014", "Ages.0.20..2014",
      "Ages.21.34..2014", "Ages.35...2014", "Male..2014", "Female..2014"
    )
  data_2012 <- data %>%
    select(
      region, "All.Ages..2012", "Ages.0.20..2012",
      "Ages.21.34..2012", "Ages.35...2012", "Male..2012", "Female..2012"
    )

  if (year == "2014") {
    if (value == "0-20") {
      data_2014_0_20 <- data_2014 %>%
        select(region, "Ages.0.20..2014")
      names(data_2014_0_20) <- c("region", "value")
      state_choropleth(data_2014_0_20,
        title =
          "2014 Age 0-20 Impaired Driving Death Rate"
      )
    } else if (value == "21-34") {
      data_2014_21_34 <- data_2014 %>%
        select(region, "Ages.21.34..2014")
      names(data_2014_21_34) <- c("region", "value")
      state_choropleth(data_2014_21_34,
        title =
          "2014 Age 21-34 Impaired Driving Death Rate"
      )
    } else if (value == "35+") {
      data_2014_35 <- data_2014 %>%
        select(region, "Ages.35...2014")
      names(data_2014_35) <- c("region", "value")
      state_choropleth(data_2014_35,
        title =
          "2014 Age 35+ Impaired Driving Death Rate"
      )
    } else if (value == "male") {
      data_2014_male <- data_2014 %>%
        select(region, "Male..2014")
      names(data_2014_male) <- c("region", "value")
      state_choropleth(data_2014_male,
        title =
          "2014 Male Impaired Driving Death Rate"
      )
    } else if (value == "female") {
      data_2014_female <- data_2014 %>%
        select(region, "Female..2014")
      names(data_2014_female) <- c("region", "value")
      state_choropleth(data_2014_female,
        title =
          "2014 Female Impaired Driving Death Rate"
      )
    } else {
      data_2014_all_age <- data_2014 %>%
        select(region, "All Ages, 2014")
      names(data_2014_all_age) <- c("region", "value")
      state_choropleth(data_2014_all_age,
        title =
          "2014 Impaired Driving Death Rate"
      )
    }
  } else if (year == "2012") {
    if (value == "0-20") {
      data_2012_0_20 <- data_2012
      select(region, "Ages.0.20..2012")
      names(data_2012_0_20) <- c("region", "value")
      state_choropleth(data_2012_0_20,
        title =
          "2012 Age 0-20 Impaired Driving Death Rate"
      )
    } else if (value == "21-34") {
      data_2012_21_34 <- data_2012 %>%
        select(region, "Ages.21.34..2012")
      names(data_2012_21_34) <- c("region", "value")
      state_choropleth(data_2012_21_34,
        title =
          "2012 Age 21-34 Impaired Driving Death Rate"
      )
    } else if (value == "35+") {
      data_2012_35 <- data_2012 %>%
        select(region, "Ages.35...2012")
      names(data_2012_35) <- c("region", "value")
      state_choropleth(data_2012_35,
        title =
          "2012 Age 21-34 Impaired Driving Death Rate"
      )
    } else if (value == "male") {
      data_2012_male <- data_2012 %>%
        select(region, "Male..2012")
      names(data_2012_male) <- c("region", "value")
      state_choropleth(data_2012_male,
        title =
          "2012 Male Impaired Driving Death Rate"
      )
    } else if (value == "female") {
      data_2012_female <- data_2012 %>%
        select(region, "Female..2012")
      names(data_2012_female) <- c("region", "value")
      state_choropleth(data_2012_female,
        title =
          "2012 Female Impaired Driving Death Rate"
      )
    } else {
      data_2012_all_age <- data_2012 %>%
        select(region, "All Ages, 2012")
      names(data_2012_all_age) <- c("region", "value")
      state_choropleth(data_2012_all_age,
        title =
          "2012 Impaired Driving Death Rate"
      )
    }
  }
}
