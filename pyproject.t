[project]
name = "finguard-fraud-api"
version = "0.1.0"
description = "A production-ready API for real-time financial fraud detection."
readme = "README.md"
requires-python = ">=3.10"
dependencies = [
    "scikit-learn>=1.3.0",
    "pandas>=2.0.0",
    "numpy>=1.24.0",
    "matplotlib>=3.7.0",
    "seaborn>=0.12.0",
    "jupyter>=1.0.0",  # For EDA in a notebook
    "fastapi>=0.104.0",
    "uvicorn[standard]>=0.24.0",
]