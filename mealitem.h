#ifndef MEALITEM_H
#define MEALITEM_H

#include <QObject>
#include "fooditem.h"

class MealItem : public QObject
{
    Q_OBJECT
public:
    explicit MealItem(QObject *parent = nullptr);
    //TODO:: build the constructor for MealItem

    QString timeStamp() const;
    void setTimeStamp(const QString &newName);
    int calories() const;
    void setCalories(int newCalories);
    int fats() const;
    void setFats(int newFats);
    int proteins() const;
    void setProteins(int newProteins);
    int carbs() const;
    void setCarbs(int newCarbs);
    Q_INVOKABLE QList<int> getGrams() const;
    Q_INVOKABLE QList<FoodItem *> getFoods() const;
    void setFoods(const QList<FoodItem *> &newFoods);
    Q_INVOKABLE void addFood(FoodItem* food, int grams);
    Q_INVOKABLE void removeFood(int index , int grams);
    Q_INVOKABLE bool isEmpty();
    Q_INVOKABLE void editFoodGramsValueAt(int index,int grams);
signals:

    void timeStampChanged();
    void caloriesChanged();
    void fatsChanged();
    void proteinsChanged();
    void carbsChanged();
    void foodsChanged();
    void gramsChanged();

private:
    QString m_timeStamp;
    int m_calories;
    int m_fats;
    int m_proteins;
    int m_carbs;
    QList<FoodItem *> m_foods;
    QList<int> m_gramsAtIndex;
    Q_PROPERTY(QString timeStamp READ timeStamp WRITE setTimeStamp NOTIFY timeStampChanged FINAL)
    Q_PROPERTY(int calories READ calories WRITE setCalories NOTIFY caloriesChanged FINAL)
    Q_PROPERTY(int fats READ fats WRITE setFats NOTIFY fatsChanged FINAL)
    Q_PROPERTY(int proteins READ proteins WRITE setProteins NOTIFY proteinsChanged FINAL)
    Q_PROPERTY(int carbs READ carbs WRITE setCarbs NOTIFY carbsChanged FINAL)
    Q_PROPERTY(QList<FoodItem *> foods READ getFoods WRITE setFoods NOTIFY foodsChanged FINAL)
    Q_PROPERTY(QList<int> gramsAtIndex READ getGrams NOTIFY gramsChanged FINAL)
};

#endif // MEALITEM_H
