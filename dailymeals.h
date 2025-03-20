#ifndef DAILYMEALS_H
#define DAILYMEALS_H

#include <QObject>
#include "mealitem.h"

class DailyMeals : public QObject
{
    Q_OBJECT
public:
    explicit DailyMeals(QObject *parent = nullptr);
     Q_INVOKABLE QList<MealItem *> meals();
     Q_INVOKABLE QString date();
     Q_INVOKABLE void createMeal(QString stamp);
     Q_INVOKABLE void addMeal(MealItem &meal);
     Q_INVOKABLE void removeMeal(int index);
     Q_INVOKABLE MealItem* getLatestMeal();
     Q_INVOKABLE void setDate(QString date);
     Q_INVOKABLE void deleteLastMeal();
 signals:
     void mealsChanged();
     void dateChanged();

 private:
    QString m_date;
    QList<MealItem *> m_meals;
     Q_PROPERTY(QList<MealItem *> meals READ meals NOTIFY mealsChanged FINAL)
     Q_PROPERTY(QString date READ date NOTIFY dateChanged FINAL)
};

#endif // DAILYMEALS_H
