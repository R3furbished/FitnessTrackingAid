#include "mealsmanager.h"


MealsManager::MealsManager(QObject *parent)
    : QObject{parent}
{}

QList<MealItem *> MealsManager::meals()
{
    return m_meals;
}

void MealsManager::addMeal(MealItem &meal)
{

}

void MealsManager::removeMeal(int index)
{

}

void MealsManager::setMeals(const QList<MealItem *> &newMeals)
{
    if (m_meals == newMeals)
        return;
    m_meals = newMeals;
    emit mealsChanged();
}
