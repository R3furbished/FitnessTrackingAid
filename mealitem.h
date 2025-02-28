#ifndef MEALITEM_H
#define MEALITEM_H

#include <QObject>
#include "fooditem.h"

class MealItem : public QObject
{
    Q_OBJECT
public:
    explicit MealItem(QObject *parent = nullptr);
    //TODO:: build the constructor for MealItem

    QString name() const;
    void setName(const QString &newName);
    QString identifier() const;
    void setIdentifier(const QString &newIdentifier);
    int calories() const;
    void setCalories(int newCalories);
    int fats() const;
    void setFats(int newFats);
    int proteins() const;
    void setProteins(int newProteins);
    int carbs() const;
    void setCarbs(int newCarbs);
    QList<FoodItem> getFoods() const;
    void setFoods(const QList<FoodItem> &newFoods);

signals:

    void nameChanged();
    void identifierChanged();
    void caloriesChanged();
    void fatsChanged();
    void proteinsChanged();
    void carbsChanged();
    void foodsChanged();

private:
    QString m_name;
    QString m_identifier;
    int m_calories;
    int m_fats;
    int m_proteins;
    int m_carbs;
    QList<FoodItem> foods;
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString identifier READ identifier WRITE setIdentifier NOTIFY identifierChanged FINAL)
    Q_PROPERTY(int calories READ calories WRITE setCalories NOTIFY caloriesChanged FINAL)
    Q_PROPERTY(int fats READ fats WRITE setFats NOTIFY fatsChanged FINAL)
    Q_PROPERTY(int proteins READ proteins WRITE setProteins NOTIFY proteinsChanged FINAL)
    Q_PROPERTY(int carbs READ carbs WRITE setCarbs NOTIFY carbsChanged FINAL)
    Q_PROPERTY(QList<FoodItem> foods READ getFoods WRITE setFoods NOTIFY foodsChanged FINAL)
};

#endif // MEALITEM_H
