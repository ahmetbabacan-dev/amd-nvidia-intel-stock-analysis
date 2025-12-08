## Project Background

Role: Financial Data Analyst

**Hypothetical Context:** This project involves a comprehensive analysis of the historical stock performance of three major tech giants: Intel (INTC), Advanced Micro Devices (AMD), and Nvidia (NVDA). The dataset spans daily price actions from 2000 to 2021. As a data analyst, the goal was to model future performance scenarios to advise portfolio allocation strategies.

The analysis breaks down the risk and return profiles of these companies, moving beyond simple historical averages to probabilistic modeling and algorithmic optimization.

Insights and recommendations are provided on the following key areas:

1. Historical Growth & Trend Analysis
2. Monte Carlo Simulation (Future Return Forecasting)
3. Risk Assessment (Volatility & Distribution Analysis)
4. Portfolio Optimization (Modern Portfolio Theory)

**Links to Project Files:**

* The Excel Workbook containing the raw data, Monte Carlo simulations, and Solver models can be found [here](https://github.com/ahmetbabacan-dev/amd-nvidia-intel-stock-analysis/blob/main/AMD%20Nvidia%20Intel%20Stock%20Analysis.xlsm). 
* The VBA Scripts used for automating the simulation runs and report generation can be found here:
* AMD stock price dataset: https://www.kaggle.com/datasets/tosinabase/amd-stock-prices-historical-data
* Nvidia stock price dataset: https://www.kaggle.com/datasets/meharshanali/nvidia-stocks-data-2025
* Intel stock price dataset: https://www.kaggle.com/datasets/tosinabase/intel-stock-prices-historical-data-intc

## Data Structure & Initial Checks

The dataset consists of daily historical stock data imported from CSVs and consolidated into a master Excel workbook. The data structure is organized into four primary sections (worksheets):
* **Raw Data (Historical):** Contains daily Date, Open, High, Low, Close, Adj Close, and Volume for INTC, AMD, and NVDA (2000–2021). This data is then cleaned and carried to another sheet without the unneeded columns.
* **Calculations & Returns:** Cleaned data along with helper columns calculating Daily Log Returns, Year, and Month for the pivot tables.
* **Monte Carlo Simulation:** A calculation block running 10,000 iterations per stock, randomly sampling from historical monthly return distributions to project 1-Year End Prices.
* **Portfolio Optimization Model:** A Solver-ready matrix containing Expected Returns, Standard Deviations, and the Covariance Matrix used for Mean-Variance Optimization.

<img width="797" height="501" alt="image" src="https://github.com/user-attachments/assets/c4048336-3fac-4813-8f21-de9b65616779" />

## Executive Summary

### Overview of Findings

Nvidia (NVDA) is the dominant growth engine of the group, offering the highest potential returns but accompanied by extreme volatility and "fat tail" risk. Conversely, Intel (INTC) acts as a stabilizing anchor with lower volatility but significantly lower expected growth. To maximize risk-adjusted returns (Sharpe Ratio), an investor should not hold these stocks equally; the optimal strategy heavily favors NVDA (capped by risk constraints) while utilizing INTC and AMD to dampen overall portfolio variance.

Snapshot of Performance:

<img width="550" height="300" alt="image" src="https://github.com/user-attachments/assets/75299df9-bb04-497b-a45b-b43045964792" />

## Insights Deep Dive

### Category 1: Historical Growth & Trend Analysis

* **Exponential Divergence:** As seen in the logarithmic scale chart, while Intel and AMD tracked closely for decades, NVDA has decoupled significantly since the mid-2010s.
* **Growth Magnitude:** The relative growth visualization highlights that NVDA's percentage growth is orders of magnitude higher than its peers in recent years, necessitating a log scale to even visualize the three on the same chart.
* **Volatility Clusters:** AMD shows periods of intense drawdown (dropping below the baseline) followed by sharp recoveries, whereas INTC shows a flatter, more mature growth curve.

### Category 2: Monte Carlo Simulation (Forecasting)

* **Simulation Scope:** 10,000 iterations were run to simulate 1-year future returns.
* **Mean Returns:** NVDA leads with a simulated mean 1-year return of 27.65%, followed by AMD at 24.26%, and INTC lagging at 5.75%.
* **Probabilistic Outcomes:** There is a 47.24% probability that NVDA returns >10% in the next year. In contrast, INTC has only a 40.30% chance of exceeding that same threshold.
* **Confidence Intervals:** The 95% Confidence Interval for NVDA's mean return is wide (25.90% to 29.39%), reflecting higher uncertainty compared to INTC’s tighter range (5.06% to 6.44%).

<img width="380" height="292" alt="image" src="https://github.com/user-attachments/assets/f735ac9b-5fda-4346-a0f6-a02d43836e4b" />
<img width="482" height="292" alt="image" src="https://github.com/user-attachments/assets/6ea20b53-147c-4d84-87d7-8cede7bcce71" />

### Category 3: Risk Assessment (Distribution Analysis)

* **Volatility (Standard Deviation):** NVDA is the riskiest asset with a standard deviation of 89.01%, nearly 2.5x that of Intel (35.12%).
* **Extreme Events (Kurtosis):** NVDA exhibits an extremely high Kurtosis of 14.17 (compared to a normal distribution of 3). This indicates "fat tails," meaning NVDA is significantly more prone to extreme outlier events (booms or crashes) than a standard statistical model would predict.
* **Skewness:** All three stocks are positively skewed, but NVDA (2.56) and AMD (2.30) are heavily skewed to the right, indicating frequent small losses offset by occasional massive gains.

<img width="452" height="360" alt="image" src="https://github.com/user-attachments/assets/e06b38a0-80fc-4318-8b22-f9a1ab462179" />

### Category 4: Portfolio Optimization (Solver)

* **Objective:** Maximize the Sharpe Ratio (Risk-Adjusted Return) using a Risk-Free Rate of ~4.04%.
* **Constraints:** To ensure diversification, no stock could exceed 50% weight, and every stock must have at least 15% allocation.
* **Optimal Allocation:**
    NVDA: 50.00% (Hit the maximum constraint).
    AMD: 28.51%
    INTC: 21.49%
* **Resulting Portfolio:** This mix yields an Expected Return of 16.55% with a Standard Deviation of 47.04%, achieving a Sharpe Ratio of 26.61%.

<img width="520" height="350" alt="image" src="https://github.com/user-attachments/assets/870a315f-b0d6-400e-9f64-00ef26c48954" />

## Recommendations

Based on the insights and findings above, we would recommend that the Investment Committee consider the following:

* **Maximize NVDA Allocation (within limits):** NVDA hits the upper constraint (50%) in our optimization model. We recommend creating a "Growth" bucket in the portfolio that is heavily weighted toward NVDA to capture its high mean return.
* **Use INTC for Volatility Dampening:** Despite INTC's lower returns, it is essential for bringing down the aggregate portfolio standard deviation. Do not eliminate INTC; maintain a floor allocation (approx. 20%) to hedge against the extreme volatility of AMD and NVDA.
* **Monitor Tail Risk (Kurtosis):** Given NVDA's high Kurtosis (14.17), standard stop-loss strategies may not be effective during gap-down events. We recommend using options hedging or dynamic rebalancing rather than simple stop-losses for the NVDA portion of the portfolio.
* **Rebalance Quarterly:** The divergence in growth rates means the portfolio will drift away from the optimal 21/28/50 split quickly. Quarterly rebalancing is required to lock in NVDA profits and buy INTC dips to maintain the target Sharpe ratio.

## Assumptions and Caveats

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* **Sampling Method:** The Monte Carlo simulation uses "Historical Resampling" (Bootstrapping) rather than assuming a Normal Distribution (NORM.INV). This was chosen to better capture the historical "fat tails" and non-normal characteristics of stock returns.
* **Past vs. Future:** The analysis assumes that the distribution of returns observed from 1980–2021 is a representative sample of future possibilities. It does not account for fundamental shifts in the semiconductor industry (e.g., the end of Moore's Law or new AI regulations).
* **Risk-Free Rate:** The Sharpe Ratio calculation utilizes a static 10-Year Treasury Yield of 4.036% as the risk-free benchmark.
* **Short-Term Correlation:** The covariance matrix is calculated based on the entire historical dataset. Short-term correlations between these stocks may fluctuate significantly during market stress, potentially reducing the diversification benefits shown in the model.
