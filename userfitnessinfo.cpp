#include "userfitnessinfo.h"

UserFitnessInfo::UserFitnessInfo(QObject *parent)
    : QObject{parent},
    m_weight(0),m_height(0),m_active_lvl(0),
    m_maint_cal(0),m_daily_cal(0),m_prot_target(0),
    m_fat_target(0),m_carb_target(0)
{}

int UserFitnessInfo::weight() const
{
    return m_weight;
}

void UserFitnessInfo::setWeight(int newWeight)
{
    if (m_weight == newWeight)
        return;
    m_weight = newWeight;
    emit weightChanged();
}

int UserFitnessInfo::height() const
{
    return m_height;
}

void UserFitnessInfo::setHeight(int newHeight)
{
    if (m_height == newHeight)
        return;
    m_height = newHeight;
    emit heightChanged();
}

int UserFitnessInfo::active_lvl() const
{
    return m_active_lvl;
}

void UserFitnessInfo::setActive_lvl(int newActive_lvl)
{
    if (m_active_lvl == newActive_lvl)
        return;
    m_active_lvl = newActive_lvl;
    emit active_lvlChanged();
}

int UserFitnessInfo::maint_cal() const
{
    return m_maint_cal;
}

void UserFitnessInfo::setMaint_cal(int newMaint_cal)
{
    if (m_maint_cal == newMaint_cal)
        return;
    m_maint_cal = newMaint_cal;
    emit maint_calChanged();
}

int UserFitnessInfo::daily_cal() const
{
    return m_daily_cal;
}

void UserFitnessInfo::setDaily_cal(int newDaily_cal)
{
    if (m_daily_cal == newDaily_cal)
        return;
    m_daily_cal = newDaily_cal;
    emit daily_calChanged();
}

int UserFitnessInfo::prot_target() const
{
    return m_prot_target;
}

void UserFitnessInfo::setProt_target(int newProt_target)
{
    if (m_prot_target == newProt_target)
        return;
    m_prot_target = newProt_target;
    emit prot_targetChanged();
}

int UserFitnessInfo::fat_target() const
{
    return m_fat_target;
}

void UserFitnessInfo::setFat_target(int newFat_target)
{
    if (m_fat_target == newFat_target)
        return;
    m_fat_target = newFat_target;
    emit fat_targetChanged();
}

int UserFitnessInfo::carb_target() const
{
    return m_carb_target;
}

void UserFitnessInfo::setCarb_target(int newCarb_target)
{
    if (m_carb_target == newCarb_target)
        return;
    m_carb_target = newCarb_target;
    emit carb_targetChanged();
}
