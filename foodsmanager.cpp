#include "foodsmanager.h"

#include<QDebug>

FoodsManager::FoodsManager(QObject *parent)
    : QObject{parent},
    m_foods(QList<FoodItem *>{})
{}

QList<FoodItem *> FoodsManager::foods() const
{
    return m_foods;
}

void FoodsManager::addFoodItem(const QString &name, int calories,int grams,int prots,int fats,int carbs)
{
    // Create a new FoodItem object , pass in the parent and add it to m_foods list;

    for(int i= 0; i < m_foods.length();i++){
        //check if foodItem already exists;
        if(m_foods[i]->name() == name){
            return;
        }
    }

    FoodItem *new_food_item = new FoodItem(this,name,calories,prots,fats,carbs,grams);
    m_foods.append(new_food_item);
    emit foodsChanged();


}

void FoodsManager::removeFoodItem(int index)
{
    //TODO:: since we can remove items from the midle , we should use a Linked List instead of a Vec
    // For better performance on removals and we have the same for last item insertions
    if(index < m_foods.length()){
        m_foods.removeAt(index);
        emit foodsChanged();
    }
}

FoodItem* FoodsManager::getFoodItemAt(int index)
{
    if(index < m_foods.length()){
        return m_foods[index];
    }
    return nullptr;
}

FoodItem* FoodsManager::getFoodItemWithName(const QString &name)
{
    if(name != ""){
        for(int i= 0; i < m_foods.length();i++){
        if(m_foods[i]->name().contains(name)){
            return m_foods[i];
        }
    }
    }
        return nullptr;
}
