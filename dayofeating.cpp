#include "dayofeating.h"

DayOfEating::DayOfEating(QObject *parent)
    : QObject{parent}
{}

int DayOfEating::calories() const
{
    return m_calories;
}

void DayOfEating::setCalories(int newCalories)
{
    if (m_calories == newCalories)
        return;
    m_calories = newCalories;
    emit caloriesChanged();
}

int DayOfEating::target_calories() const
{
    return m_target_calories;
}

void DayOfEating::setTarget_calories(int newTarget_calories)
{
    if (m_target_calories == newTarget_calories)
        return;
    m_target_calories = newTarget_calories;
    emit target_caloriesChanged();
}

int DayOfEating::proteins() const
{
    return m_proteins;
}

void DayOfEating::setProteins(int newProteins)
{
    if (m_proteins == newProteins)
        return;
    m_proteins = newProteins;
    emit proteinsChanged();
}

int DayOfEating::target_proteins() const
{
    return m_target_proteins;
}

void DayOfEating::setTarget_proteins(int newTarget_proteins)
{
    if (m_target_proteins == newTarget_proteins)
        return;
    m_target_proteins = newTarget_proteins;
    emit target_proteinsChanged();
}

int DayOfEating::fats() const
{
    return m_fats;
}

void DayOfEating::setFats(int newFats)
{
    if (m_fats == newFats)
        return;
    m_fats = newFats;
    emit fatsChanged();
}

int DayOfEating::target_fats() const
{
    return m_target_fats;
}

void DayOfEating::setTarget_fats(int newTarget_fats)
{
    if (m_target_fats == newTarget_fats)
        return;
    m_target_fats = newTarget_fats;
    emit target_fatsChanged();
}

int DayOfEating::carbs() const
{
    return m_carbs;
}

void DayOfEating::setCarbs(int newCarbs)
{
    if (m_carbs == newCarbs)
        return;
    m_carbs = newCarbs;
    emit carbsChanged();
}

int DayOfEating::target_carbs() const
{
    return m_target_carbs;
}

void DayOfEating::setTarget_carbs(int newTarget_carbs)
{
    if (m_target_carbs == newTarget_carbs)
        return;
    m_target_carbs = newTarget_carbs;
    emit target_carbsChanged();
}

QString DayOfEating::getDate() const
{
    return date;
}

void DayOfEating::setDate(const QString &newDate)
{
    if (date == newDate)
        return;
    date = newDate;
    emit dateChanged();
}

QList<MealItem> DayOfEating::getMeals() const
{
    return meals;
}

void DayOfEating::setMeals(const QList<MealItem> &newMeals)
{
    // if (meals == newMeals)
    //     return;
    // meals = newMeals;
    // emit mealsChanged();
}
