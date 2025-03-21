#include "dailymeals.h"
#include <QDebug>

DailyMeals::DailyMeals(QObject *parent)
    : QObject{parent},
     m_meals(QList<MealItem *>{}),
    m_dayKcal(0),m_dayProt(0),m_dayFats(0),m_dayCarbs(0)
{}

QList<MealItem *> DailyMeals::meals()
{
    return m_meals;
}

QString DailyMeals::date()
{
    return m_date;
}

void DailyMeals::addMeal(MealItem* meal)
{
    int protein = meal->proteins();
    int carbs =  meal->carbs();
    int fats = meal->fats();
    int calories = meal->calories();

    setDayKcal(calories + m_dayKcal);
    setDayProt(protein + m_dayProt);
    setDayFats(fats + m_dayFats);
    setDayCarbs(carbs + m_dayCarbs);

    qDebug()<< "added meal";
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

int DailyMeals::dayKcal() const
{
    return m_dayKcal;
}

void DailyMeals::setDayKcal(int newDayKcal)
{
    if (m_dayKcal == newDayKcal)
        return;
    m_dayKcal = newDayKcal;
    emit dayKcalChanged();
}

int DailyMeals::dayProt() const
{
    return m_dayProt;
}

void DailyMeals::setDayProt(int newDayProt)
{
    if (m_dayProt == newDayProt)
        return;
    m_dayProt = newDayProt;
    emit dayProtChanged();
}

int DailyMeals::dayFats() const
{
    return m_dayFats;
}

void DailyMeals::setDayFats(int newDayFats)
{
    if (m_dayFats == newDayFats)
        return;
    m_dayFats = newDayFats;
    emit dayFatsChanged();
}

int DailyMeals::dayCarbs() const
{
    return m_dayCarbs;
}

void DailyMeals::setDayCarbs(int newDayCarbs)
{
    if (m_dayCarbs == newDayCarbs)
        return;
    m_dayCarbs = newDayCarbs;
    emit dayCarbsChanged();
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
{	MealItem* meal = m_meals[index];

    int protein = meal->proteins();
    int carbs =  meal->carbs();
    int fats = meal->fats();
    int calories = meal->calories();

    setDayKcal(m_dayKcal - calories);
    setDayProt(m_dayProt - protein);
    setDayFats(m_dayFats - fats);
    setDayCarbs(m_dayCarbs - carbs);

    m_meals.removeAt(index);
    emit mealsChanged();
}


