#ifndef FOODSMANAGER_H
#define FOODSMANAGER_H

#include <QObject>
#include "fooditem.h"

class FoodsManager : public QObject
{
    Q_OBJECT
public:
    explicit FoodsManager(QObject *parent = nullptr);

    Q_INVOKABLE QList<FoodItem *> foods() const;

    Q_INVOKABLE void addFoodItem(const QString &name, int calories,int grams = 100,int protsa = 0,int fats= 0,int carbs=0);// This has to take info from Qt side and pass it into the FoodItem constructor
    Q_INVOKABLE void removeFoodItem(int index);


signals:

    void foodsChanged();

private:
    QList<FoodItem *> m_foods;
    Q_PROPERTY(QList<FoodItem *> foods READ foods NOTIFY foodsChanged FINAL)
};

#endif // FOODSMANAGER_H
