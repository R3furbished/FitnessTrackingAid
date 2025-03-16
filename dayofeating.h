#ifndef DAYOFEATING_H
#define DAYOFEATING_H

#include <QObject>

class DayOfEating : public QObject
{
    Q_OBJECT
public:
    explicit DayOfEating(QObject *parent = nullptr);

signals:
};

#endif // DAYOFEATING_H
