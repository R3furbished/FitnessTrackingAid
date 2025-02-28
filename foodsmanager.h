#ifndef FOODSMANAGER_H
#define FOODSMANAGER_H

#include <QObject>
#include "fooditem.h"

class FoodsManager : public QObject
{
    Q_OBJECT
public:
    explicit FoodsManager(QObject *parent = nullptr);

signals:

private:
    QList<FoodItem *> m_foods;
};

#endif // FOODSMANAGER_H
