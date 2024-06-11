#ifndef DISHESNEARESTRESTAURANTMODEL_H
#define DISHESNEARESTRESTAURANTMODEL_H

#include <QAbstractListModel>
#include <QString>

typedef QHash<int, QByteArray> RolesHash;

class DishesNearestRestaurantModel: public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        DishNameRole = Qt::UserRole + 1,
        DishPhotoRole,
        DishPriceRole,
        DishWeightRole
    };
    Q_ENUM(Roles)

public:
    DishesNearestRestaurantModel(QObject* parent = nullptr);

    struct DishInfo {
        QString dishName;
        QString dishPrice;
        QString dishWeight;
        QString dishImage;
    };



public:
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;

    void get(double latitude, double longitude);

    RolesHash roleNames() const override;

private:
    void slotRequestCompleted();


private:
    QVector<DishInfo> m_dishes;
};

#endif // DISHESNEARESTRESTAURANTMODEL_H
