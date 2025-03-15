#ifndef MEALSMANAGER_H
#define MEALSMANAGER_H

#include <QObject>
#include "mealitem.h"

class MealsManager : public QObject
{
    Q_OBJECT
public:
    explicit MealsManager(QObject *parent = nullptr);
     Q_INVOKABLE QList<MealItem *> meals();
     Q_INVOKABLE void addMeal(MealItem &meal);
     Q_INVOKABLE void removeMeal(int index);
    // get meals list , add meal to the list , remove meal from the list;

     void setMeals(const QList<MealItem *> &newMeals);

 signals:
     void mealsChanged();

 private:
    QList<MealItem *> m_meals;
     Q_PROPERTY(QList<MealItem *> meals READ meals WRITE setMeals NOTIFY mealsChanged FINAL)
};

#endif // MEALSMANAGER_H
