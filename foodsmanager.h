#ifndef FOODSMANAGER_H
#define FOODSMANAGER_H

#include <QObject>
#include "fooditem.h"

class FoodsManager : public QObject
{
    Q_OBJECT
public:
    explicit FoodsManager(QObject *parent = nullptr);

    QList<FoodItem *> foods() const;
    void setFoods(const QList<FoodItem *> &newFoods);
    void resetFoods();
    void addFoodItem();// This has to take info from Qt side and pass it into the FoodItem constructor


signals:

    void foodsChanged();

private:
    QList<FoodItem *> m_foods;
    Q_PROPERTY(QList<FoodItem *> foods READ foods WRITE setFoods RESET resetFoods NOTIFY foodsChanged FINAL)
};

#endif // FOODSMANAGER_H
