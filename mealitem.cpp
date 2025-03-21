#include "mealitem.h"

#include<QDebug>
MealItem::MealItem(QObject *parent)
    : QObject{parent} , m_foods(QList<FoodItem *>{}),m_gramsAtIndex(QList<int> {}), m_timeStamp(""),m_calories(0),
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
    qDebug()<< "Calories changed to" << m_calories;
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

QList<int> MealItem::getGrams() const
{
    return m_gramsAtIndex;
}


void MealItem::setFoods(const QList<FoodItem *> &newFoods)
{
    // if (foods == newFoods)
    //     return;
    // foods = newFoods;
    // emit foodsChanged();
}

void MealItem::addFood(FoodItem* food, int grams)
{

    int protein = (grams * food->proteins()) / food->grams_value();
    int carbs = (grams * food->carbs()) / food->grams_value();
    int fats = (grams * food->fats()) / food->grams_value();
    int calories = (grams * food->calories()) / food->grams_value();

    setCalories(calories + m_calories);
    setProteins(protein + m_proteins);
    setCarbs(carbs + m_carbs);
    setFats(fats + m_fats);

    m_foods.append(food);
    m_gramsAtIndex.append(grams);
    qDebug()<< "added food with grams" << calories;
    emit foodsChanged();
    emit gramsChanged();
}
void MealItem::removeFood(int index, int grams)
{
    if(index < m_foods.size()){
    FoodItem* food = m_foods[index];

    int protein = (grams * food->proteins()) / food->grams_value();
    int carbs = (grams * food->carbs()) / food->grams_value();
    int fats = (grams * food->fats()) / food->grams_value();
    int calories = (grams * food->calories()) / food->grams_value();

    setCalories(m_calories - calories);
    setProteins(m_proteins - protein);
    setCarbs(m_carbs - carbs);
    setFats(m_fats - fats);

    m_foods.removeAt(index);
    m_gramsAtIndex.removeAt(index);
    emit foodsChanged();
    emit gramsChanged();
    }
}

bool MealItem::isEmpty(){
    return m_calories == 0;
}
