# FinGuard: A Production-Ready Fraud Detection API

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue)](https://www.python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Project Status: Active Development](https://img.shields.io/badge/Status-Active%20Development-brightgreen)]()

A machine learning microservice engineered to identify fraudulent financial transactions in real-time. This project demonstrates the full ML lifecycle—from exploratory analysis and model training to API deployment and containerization—mimicking the workflow of a fintech startup's founding AI engineer.

## 📊 Business Context & Problem

For a digital bank or payment processor, fraud represents a direct loss to revenue and erodes customer trust. However, an over-sensitive system that blocks legitimate transactions (false positives) damages user experience and can be equally costly.

**The Core Challenge:** Building a system that optimally balances two competing business costs:
- **Cost of Fraud (False Negative):** Lost capital and administrative overhead.
- **Cost of False Alarms (False Positive):** Customer friction, support tickets, and potential churn.

This project tackles this imbalance by building a model optimized for business metrics, not just academic accuracy, and deploying it as a scalable, low-latency API.

---

## 🔍 Week 1: Exploratory Data Analysis & Key Findings

The first sprint focused on understanding the [PaySim](https://www.kaggle.com/datasets/ealaxi/paysim1) synthetic financial dataset, which mirrors real-world mobile money transaction logs.

### **1. Severe Class Imbalance: The Baseline Challenge**
- **Fraud Rate:** Only **0.13%** of all transactions are fraudulent.
- **Baseline Accuracy:** A naive model that always predicts "not fraud" would be **99.87% accurate** but **100% useless**.
- **Implication:** Standard accuracy is a misleading metric. Evaluation must focus on **Precision, Recall, and the F1-Score** to meaningfully gauge performance.

### **2. Fraud is Highly Concentrated**
- Nearly all fraudulent activity occurs in just two transaction types: **`TRANSFER`** and **`CASH_OUT`**.
- **Insight:** This allows for strategic feature engineering and suggests that a model can focus its "attention" on these high-risk pathways.

### **3. Monetary Patterns are Subtle**
- While fraudulent transactions have a **slightly higher median amount**, the distributions of `amount` for fraud and non-fraud overlap significantly.
- **Insuiton:** Transaction amount alone is a weak predictor. The predictive signal likely lies in the **relationship between amounts and account balances before/after the transaction**.

*For detailed analysis and charts, see the full [EDA Notebook](./notebooks/eda.ipynb).*

---

## 🗺️ Project Roadmap & Technical Architecture

This project is developed in weekly sprints, each adding a production-grade component to the system.

| Week | Sprint Focus | Key Deliverables | Status |
| :--- | :--- | :--- | :--- |
| **1** | **Data Foundation & EDA** | Data pipeline, imbalance analysis, hypothesis generation | ✅ **Complete** |
| **2** | **Feature Engineering & Model Training** | Creation of domain-specific features, model selection, and validation focused on recall/F1. | 🔄 **Next** |
| **3** | **API Development & Validation** | FastAPI service, request/response schemas, performance endpoint. | ⏳ **Planned** |
| **4** | **Containerization & Deployment** | Dockerization, CI/CD pipeline setup, and deployment to a cloud service (e.g., Heroku/AWS). | ⏳ **Planned** |

**Target Architecture:**
```
    Client Request
        │
        ▼
    [FastAPI Server] ←→ [ML Model (Scikit-learn)]
        │
        ▼
    [Logging & Monitoring]
```
---

## 🚀 Getting Started

### **Prerequisites**
- Python 3.10+
- pip

### **Installation & Setup**
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/haroonmasood7000/FinGuard-Fraud-API.git
    cd FinGuard-Fraud-API
    ```
2.  **Create a virtual environment and install dependencies:**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows: `venv\Scripts\activate`
    pip install -r requirements.txt
    ```
3.  **Run the Jupyter notebook to view the EDA:**
    ```bash
    jupyter notebook notebooks/eda.ipynb
    ```

### **Repository Structure**
```
FinGuard-Fraud-API/
├── data/               # Original and processed datasets
├── notebooks/          # Jupyter notebooks for analysis
│   └── eda.ipynb      # Week 1: Exploratory Data Analysis
├── src/                # Source code for API and ML model (Coming Soon)
├── requirements.txt    # Project dependencies
└── README.md           # This file
```

---

## 📈 Next Steps: Week 2 Preview

The focus shifts from analysis to engineering. Key tasks will include:
1.  **Feature Engineering:** Creating predictive features based on EDA insights (e.g., `balance_change_origin`, `transaction_type_risk`).
2.  **Model Training Pipeline:** Building a robust `sklearn` pipeline with proper cross-validation to address class imbalance.
3.  **Model Selection & Evaluation:** Comparing models (Logistic Regression, Random Forest, XGBoost) using Precision-Recall curves and optimizing for the **F1-Score**.

---

## 🤝 Contributing
This is a portfolio project part of a structured AI Engineering roadmap. Feedback and suggestions are welcome—please open an issue or discussion in the repo.

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

---
*Built as part of a project-based roadmap to transition into an AI/ML Engineering role.*

