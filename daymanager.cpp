#include "daymanager.h"
#include <QDebug>

DayManager::DayManager(QObject *parent)
    : QObject{parent},
    m_days(QList<DailyMeals *>{})
{}

QList<DailyMeals *> DayManager::days() const
{
    return m_days;
}

void DayManager::newDay(QString date){
    //Add a new empty day to the list of days
    DailyMeals *newDay = new DailyMeals();
    newDay->setDate(date);
    m_days.append(newDay);

}


DailyMeals* DayManager::getDayWithDate(QString date){
    for(auto day: m_days){
        if(day->date() == date){
            return day;
        }
    }
    return nullptr;
}


bool DayManager::hasDayWithDate(QString date){
    for(auto day: m_days){
        if(day->date() == date){
            return true;
        }
    }
    return false;
}

DailyMeals* DayManager::getDayAt(int index)
{
    return m_days[index];
}
DailyMeals* DayManager::getLatestDay()
{
    return m_days.last();
}
