#include "foodsmanager.h"

FoodsManager::FoodsManager(QObject *parent)
    : QObject{parent}
{}

QList<FoodItem *> FoodsManager::foods() const
{
    return m_foods;
}

void FoodsManager::setFoods(const QList<FoodItem *> &newFoods)
{
    if (m_foods == newFoods)
        return;
    m_foods = newFoods;
    emit foodsChanged();
}

void FoodsManager::resetFoods()
{
    setFoods({}); // TODO: Adapt to use your actual default value
}
