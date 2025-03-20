#ifndef USERFITNESSINFO_H
#define USERFITNESSINFO_H

#include <QObject>

class UserFitnessInfo : public QObject
{
    Q_OBJECT
public:
    explicit UserFitnessInfo(QObject *parent = nullptr);

    int weight() const;
    void setWeight(int newWeight);
    int height() const;
    void setHeight(int newHeight);
    int active_lvl() const;
    void setActive_lvl(int newActive_lvl);
    int maint_cal() const;
    void setMaint_cal(int newMaint_cal);
    int daily_cal() const;
    void setDaily_cal(int newDaily_cal);
    int prot_target() const;
    void setProt_target(int newProt_target);
    int fat_target() const;
    void setFat_target(int newFat_target);
    int carb_target() const;
    void setCarb_target(int newCarb_target);

signals:
    void weightChanged();
    void heightChanged();
    void active_lvlChanged();
    void maint_calChanged();
    void daily_calChanged();
    void prot_targetChanged();
    void fat_targetChanged();
    void carb_targetChanged();

private:
    int m_weight;
    int m_height;
    int m_active_lvl;
    int m_maint_cal;
    int m_daily_cal;
    int m_prot_target;
    int m_fat_target;
    int m_carb_target;
    Q_PROPERTY(int weight READ weight WRITE setWeight NOTIFY weightChanged FINAL)
    Q_PROPERTY(int height READ height WRITE setHeight NOTIFY heightChanged FINAL)
    Q_PROPERTY(int active_lvl READ active_lvl WRITE setActive_lvl NOTIFY active_lvlChanged FINAL)
    Q_PROPERTY(int maint_cal READ maint_cal WRITE setMaint_cal NOTIFY maint_calChanged FINAL)
    Q_PROPERTY(int daily_cal READ daily_cal WRITE setDaily_cal NOTIFY daily_calChanged FINAL)
    Q_PROPERTY(int prot_target READ prot_target WRITE setProt_target NOTIFY prot_targetChanged FINAL)
    Q_PROPERTY(int fat_target READ fat_target WRITE setFat_target NOTIFY fat_targetChanged FINAL)
    Q_PROPERTY(int carb_target READ carb_target WRITE setCarb_target NOTIFY carb_targetChanged FINAL)
};

#endif // USERFITNESSINFO_H
