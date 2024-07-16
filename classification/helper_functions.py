from sklearn.model_selection import GridSearchCV
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import roc_curve, auc
from xgboost import XGBClassifier # type: ignore
from sklearn.preprocessing import LabelEncoder

def grid_train_random_forest(X, y, params, n_folds=4, eval_metric='accuracy'):
    """
    Train Random Forest binary classifier using a grid of hyperparameters. Return
    the best model according to the specified metric.

    Args:
        X: Array-like of shape (n_samples,n_features) - Test feature data.
        y: Array-like of shape (n_samples,) - Test target data.
        params: Dictionary - Parameter grid on which to perform cross validation.
        n_folds: int - Number of folds to use for cross validation.
        eval_metric: str - Metric to use for evaluating model performance in cross validation.

    Returns:
        model: Best Random Forest model according to evaluation metric.

    Examples:
        model = grid_train_random_forest(X, y, params, 4, "accuracy")
    """
    grid_search = GridSearchCV(RandomForestClassifier(), param_grid=params, scoring='accuracy', cv=5, n_jobs=-1) 
    grid_search.fit(X, y)
    rf_model = grid_search.best_estimator_
    return rf_model


def calc_roc_metrics(X, y, model):
    """
    Calculate False Positive Rate (FPR), True Positive Rate (TPR), and Area Under ROC Curve (AUC)
    for a given binary classification model and test data.

    Args:
        X: Array-like of shape (n_samples,n_features) - Test feature data.
        y: Array-like of shape (n_samples,) - Test target data.
        model: Scikit-learn style binary classification model.

    Returns:
        fpr: float - False Positive Rate.
        tpr: float - True Positive Rate.
        auc: float - Area Under ROC Curve.

    Examples:
        fpr, tpr, auc = calc_roc_metrics(X, y, model)
    """
    y_prob = model.predict_proba(X)[:, 1]
    fpr, tpr, _ = roc_curve(y, y_prob, pos_label='Yes')  
    auc_score = auc(fpr, tpr) 
    return fpr, tpr, auc_score 
    

def train_xgboost(X_train, y_train, X_test, y_test, params, n_round):
    """
    Train an XGBoost model with the given parameters and train/test data.

    Args:
        X_train: Array-like of shape (n_train_samples,n_features) - Train feature data.
        y_train: Array-like of shape (n_train_samples,) - Train target data.
        X_test: Array-like of shape (n_test_samples,n_features) - Test feature data.
        y_test: Array-like of shape (n_test_samples,) - Test target data.
        params: Dictionary - Parameters to pass into XGBoost trainer.
        n_round: int - Number of rounds of training.

    Returns:
        model: Trained XGBoost model.

    Examples:
        model = calc_roc_metrics(X_train, y_train, X_test, y_test, params)
    """
    le = LabelEncoder()
    y_train_encoded = le.fit_transform(y_train)
    y_test_encoded = le.transform(y_test)

    xgb_model = XGBClassifier(**params)
    xgb_model.fit(X_train, y_train_encoded, eval_set=[(X_test, y_test_encoded)])
    return xgb_model
