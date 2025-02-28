#ifndef FOODITEM_H
#define FOODITEM_H

#include <QObject>

class FoodItem : public QObject
{
    Q_OBJECT
public:
    explicit FoodItem(QObject *parent = nullptr);
    //TODO:: build the constructor for FoodITem
    explicit FoodItem(QObject *parent,QString name, int calories, int proteins = 0, int fats = 0, int carbs = 0, int grams = 100);

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
    int grams_value() const;
    void setGrams_value(int newGrams_value);

signals:

    void nameChanged();
    void identifierChanged();
    void caloriesChanged();
    void fatsChanged();
    void proteinsChanged();
    void carbsChanged();
    void grams_valueChanged();

private:
    QString m_name;
    QString m_identifier;
    int m_calories;
    int m_fats;
    int m_proteins;
    int m_carbs;
    int m_grams_value;
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(QString identifier READ identifier WRITE setIdentifier NOTIFY identifierChanged FINAL)
    Q_PROPERTY(int calories READ calories WRITE setCalories NOTIFY caloriesChanged FINAL)
    Q_PROPERTY(int fats READ fats WRITE setFats NOTIFY fatsChanged FINAL)
    Q_PROPERTY(int proteins READ proteins WRITE setProteins NOTIFY proteinsChanged FINAL)
    Q_PROPERTY(int carbs READ carbs WRITE setCarbs NOTIFY carbsChanged FINAL)
    Q_PROPERTY(int grams_value READ grams_value WRITE setGrams_value NOTIFY grams_valueChanged FINAL)

};

#endif // FOODITEM_H
