#include "mealitem.h"

#include<QDebug>
MealItem::MealItem(QObject *parent)
    : QObject{parent} , m_foods(QList<FoodItem *>{}), m_timeStamp(""),m_calories(0),
    m_fats(0),m_proteins(0),m_carbs(0)
{}

QString MealItem::timeStamp() const
{
    return m_timeStamp;
}

void MealItem::setTimeStamp(const QString &timeStamp)
{
    if (m_timeStamp == timeStamp)
        return;
     m_timeStamp =  timeStamp;
    emit timeStampChanged();
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

QList<FoodItem *> MealItem::getFoods() const
{
    return m_foods;
}

void MealItem::setFoods(const QList<FoodItem *> &newFoods)
{
    // if (foods == newFoods)
    //     return;
    // foods = newFoods;
    // emit foodsChanged();
}

void MealItem::addFood(FoodItem* food)
{
    qDebug() << "Food added to meal";
    m_foods.append(food);
    //TODO:: after adding the food , need to
    // calculate the macro values according to the grams
    // and update the macro values in this meal;
    emit foodsChanged();
}
void MealItem::removeFood(int index)
{
    m_foods.removeAt(index);
    //TODO:: after removing the food , need to
    // calculate the macro values according to the grams
    // and update the macro values in this meal;
    emit foodsChanged();
}
