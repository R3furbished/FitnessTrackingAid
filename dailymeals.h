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
     Q_INVOKABLE void addMeal(MealItem *meal);
     Q_INVOKABLE void removeMeal(int index);
     Q_INVOKABLE MealItem* getLatestMeal();
     Q_INVOKABLE void setDate(QString date);
     Q_INVOKABLE void deleteLastMeal();
     int dayKcal() const;
     void setDayKcal(int newDayKcal);
     int dayProt() const;
     void setDayProt(int newDayProt);
     int dayFats() const;
     void setDayFats(int newDayFats);
     int dayCarbs() const;
     void setDayCarbs(int newDayCarbs);

 signals:
     void mealsChanged();
     void dateChanged();

     void dayKcalChanged();
     void dayProtChanged();
     void dayFatsChanged();
     void dayCarbsChanged();

 private:
    QString m_date;
    QList<MealItem *> m_meals;
    int m_dayKcal;
    int m_dayProt;
    int m_dayFats;
    int m_dayCarbs;
     Q_PROPERTY(QList<MealItem *> meals READ meals NOTIFY mealsChanged FINAL)
     Q_PROPERTY(QString date READ date NOTIFY dateChanged FINAL)
     Q_PROPERTY(int dayKcal READ dayKcal WRITE setDayKcal NOTIFY dayKcalChanged FINAL)
     Q_PROPERTY(int dayProt READ dayProt WRITE setDayProt NOTIFY dayProtChanged FINAL)
     Q_PROPERTY(int dayFats READ dayFats WRITE setDayFats NOTIFY dayFatsChanged FINAL)
     Q_PROPERTY(int dayCarbs READ dayCarbs WRITE setDayCarbs NOTIFY dayCarbsChanged FINAL)
};

#endif // DAILYMEALS_H
