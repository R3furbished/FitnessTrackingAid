#include "fooditem.h"

FoodItem::FoodItem(QObject *parent)
    : QObject{parent}
{}

FoodItem::FoodItem(QObject *parent,QString name, int calories, int proteins, int fats, int carbs, int grams)
    : QObject{parent}
{
    this->m_name = name;
    this->m_calories = calories;
    this->m_proteins = proteins;
    this->m_fats = fats;
    this->m_carbs = carbs;
    this->m_grams_value = grams;
}

QString FoodItem::name() const
{
    return m_name;
}

void FoodItem::setName(const QString &newName)
{
    if (m_name == newName)
        return;
    m_name = newName;
    emit nameChanged();
}

QString FoodItem::identifier() const
{
    return m_identifier;
}

void FoodItem::setIdentifier(const QString &newIdentifier)
{
    if (m_identifier == newIdentifier)
        return;
    m_identifier = newIdentifier;
    emit identifierChanged();
}

int FoodItem::calories() const
{
    return m_calories;
}

void FoodItem::setCalories(int newCalories)
{
    if (m_calories == newCalories)
        return;
    m_calories = newCalories;
    emit caloriesChanged();
}

int FoodItem::fats() const
{
    return m_fats;
}

void FoodItem::setFats(int newFats)
{
    if (m_fats == newFats)
        return;
    m_fats = newFats;
    emit fatsChanged();
}

int FoodItem::proteins() const
{
    return m_proteins;
}

void FoodItem::setProteins(int newProteins)
{
    if (m_proteins == newProteins)
        return;
    m_proteins = newProteins;
    emit proteinsChanged();
}

int FoodItem::carbs() const
{
    return m_carbs;
}

void FoodItem::setCarbs(int newCarbs)
{
    if (m_carbs == newCarbs)
        return;
    m_carbs = newCarbs;
    emit carbsChanged();
}

int FoodItem::grams_value() const
{
    return m_grams_value;
}

void FoodItem::setGrams_value(int newGrams_value)
{
    if (m_grams_value == newGrams_value)
        return;
    m_grams_value = newGrams_value;
    emit grams_valueChanged();
}
