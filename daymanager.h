#ifndef DAYMANAGER_H
#define DAYMANAGER_H

#include <QObject>
#include "dailymeals.h"
#include "mealitem.h"

class DayManager : public QObject
{
    Q_OBJECT
public:
    explicit DayManager(QObject *parent = nullptr);
    Q_INVOKABLE void newDay(QString date);
    Q_INVOKABLE bool hasDayWithDate(QString date);
    Q_INVOKABLE DailyMeals* getDayWithDate(QString date);
    Q_INVOKABLE DailyMeals* getDayAt(int index);
    Q_INVOKABLE DailyMeals* getLatestDay();
    QList<DailyMeals *> days() const;

signals:
    void daysChanged();

private:
    QList<DailyMeals *> m_days;
    Q_PROPERTY(QList<DailyMeals *> days READ days NOTIFY daysChanged FINAL)
};

#endif // DAYMANAGER_H
