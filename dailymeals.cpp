#include "dailymeals.h"


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

void DailyMeals::createMeal()
{
    MealItem *newMeal = new MealItem();
    m_meals.append(newMeal);
}

void DailyMeals::deleteLastMeal(){
    if (!m_meals.isEmpty()) m_meals.removeLast();
}

MealItem* DailyMeals::getLatestMeal(){
    if(!m_meals.isEmpty()){
    return m_meals.last();
    }
    return nullptr;
}

void DailyMeals::setDate(QString date){
    m_date = date;
}

void DailyMeals::removeMeal(int index)
{

}


