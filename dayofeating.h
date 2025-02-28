#ifndef DAYOFEATING_H
#define DAYOFEATING_H

#include <QObject>
#include "mealitem.h"

class DayOfEating : public QObject
{
    Q_OBJECT
public:
    explicit DayOfEating(QObject *parent = nullptr);
    //TODO:: build the constructor for DayOfEatingItem

    int calories() const;
    void setCalories(int newCalories);
    int target_calories() const;
    void setTarget_calories(int newTarget_calories);
    int proteins() const;
    void setProteins(int newProteins);
    int target_proteins() const;
    void setTarget_proteins(int newTarget_proteins);
    int fats() const;
    void setFats(int newFats);
    int target_fats() const;
    void setTarget_fats(int newTarget_fats);
    int carbs() const;
    void setCarbs(int newCarbs);
    int target_carbs() const;
    void setTarget_carbs(int newTarget_carbs);
    QString getDate() const;
    void setDate(const QString &newDate);
    QList<MealItem> getMeals() const;
    void setMeals(const QList<MealItem> &newMeals);

signals:

    void caloriesChanged();
    void target_caloriesChanged();
    void proteinsChanged();
    void target_proteinsChanged();
    void fatsChanged();
    void target_fatsChanged();
    void carbsChanged();
    void target_carbsChanged();
    void dateChanged();
    void mealsChanged();

private:
    int m_calories;
    int m_target_calories;
    int m_proteins;
    int m_target_proteins;
    int m_fats;
    int m_target_fats;
    int m_carbs;
    int m_target_carbs;
    QString date;
    QList<MealItem> meals;
    Q_PROPERTY(int calories READ calories WRITE setCalories NOTIFY caloriesChanged FINAL)
    Q_PROPERTY(int target_calories READ target_calories WRITE setTarget_calories NOTIFY target_caloriesChanged FINAL)
    Q_PROPERTY(int proteins READ proteins WRITE setProteins NOTIFY proteinsChanged FINAL)
    Q_PROPERTY(int target_proteins READ target_proteins WRITE setTarget_proteins NOTIFY target_proteinsChanged FINAL)
    Q_PROPERTY(int fats READ fats WRITE setFats NOTIFY fatsChanged FINAL)
    Q_PROPERTY(int target_fats READ target_fats WRITE setTarget_fats NOTIFY target_fatsChanged FINAL)
    Q_PROPERTY(int carbs READ carbs WRITE setCarbs NOTIFY carbsChanged FINAL)
    Q_PROPERTY(int target_carbs READ target_carbs WRITE setTarget_carbs NOTIFY target_carbsChanged FINAL)
    Q_PROPERTY(QString date READ getDate WRITE setDate NOTIFY dateChanged FINAL)
    Q_PROPERTY(QList<MealItem> meals READ getMeals WRITE setMeals NOTIFY mealsChanged FINAL)
};

#endif // DAYOFEATING_H
