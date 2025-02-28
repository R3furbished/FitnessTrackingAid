#include "mealitem.h"

MealItem::MealItem(QObject *parent)
    : QObject{parent}
{}

QString MealItem::name() const
{
    return m_name;
}

void MealItem::setName(const QString &newName)
{
    if (m_name == newName)
        return;
    m_name = newName;
    emit nameChanged();
}

QString MealItem::identifier() const
{
    return m_identifier;
}

void MealItem::setIdentifier(const QString &newIdentifier)
{
    if (m_identifier == newIdentifier)
        return;
    m_identifier = newIdentifier;
    emit identifierChanged();
}

int MealItem::calories() const
{
    return m_calories;
}

void MealItem::setCalories(int newCalories)
{
    if (m_calories == newCalories)
        return;
    m_calories = newCalories;
    emit caloriesChanged();
}

int MealItem::fats() const
{
    return m_fats;
}

void MealItem::setFats(int newFats)
{
    if (m_fats == newFats)
        return;
    m_fats = newFats;
    emit fatsChanged();
}

int MealItem::proteins() const
{
    return m_proteins;
}

void MealItem::setProteins(int newProteins)
{
    if (m_proteins == newProteins)
        return;
    m_proteins = newProteins;
    emit proteinsChanged();
}

int MealItem::carbs() const
{
    return m_carbs;
}

void MealItem::setCarbs(int newCarbs)
{
    if (m_carbs == newCarbs)
        return;
    m_carbs = newCarbs;
    emit carbsChanged();
}

QList<FoodItem> MealItem::getFoods() const
{
    return foods;
}

void MealItem::setFoods(const QList<FoodItem> &newFoods)
{
    // if (foods == newFoods)
    //     return;
    // foods = newFoods;
    // emit foodsChanged();
}
