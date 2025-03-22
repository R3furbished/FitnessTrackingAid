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
    emit daysChanged();

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

{   if(!m_days.isEmpty()){
    assert(m_days[0]!=nullptr);
        qDebug() << m_days[0];
    return m_days[m_days.length()-1];
    }
        return nullptr;
}
