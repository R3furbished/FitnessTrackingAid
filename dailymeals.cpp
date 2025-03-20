#include "dailymeals.h"
#include <QDebug>

DailyMeals::DailyMeals(QObject *parent)
    : QObject{parent},
     m_meals(QList<MealItem *>{})
{}

QList<MealItem *> DailyMeals::meals()
{
    return m_meals;
}

QString DailyMeals::date()
{
    return m_date;
}

void DailyMeals::addMeal(MealItem &meal)
{

}

void DailyMeals::createMeal(QString stamp)
{
    MealItem *newMeal = new MealItem();
    newMeal->setTimeStamp(stamp);
    m_meals.append(newMeal);
    emit mealsChanged();
}

void DailyMeals::deleteLastMeal(){
    if (!m_meals.isEmpty()) m_meals.removeLast();
    emit mealsChanged();
}

MealItem* DailyMeals::getLatestMeal(){
    if(!m_meals.isEmpty()){
    return m_meals.last();
    }
    return nullptr;
}

void DailyMeals::setDate(QString date){
    m_date = date;
    emit dateChanged();
}

void DailyMeals::removeMeal(int index)
{

}


