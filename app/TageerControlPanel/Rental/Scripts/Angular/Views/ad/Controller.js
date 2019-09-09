/// <reference path="../../Shared/Module.js" />
myApp.controller('ctrlAds', ['$scope', '$http', '$filter', 'serviceAds', 'serviceView', function (s, h, filter, service, serviceView) {

    //<!--Config-->
    s.Token = Token;
    s.adsFilter = {
        lastAdId: 0,
        take: 30,
        categoryId: null,
        subCategoryId: null,
        countryId: null,
        provinceId: null,
        title: "",
        ucerCreatedId: getQueryStringValue("userId")
    };
    s.ads = [];

    s.categories = [{ Id: null, CategoryName: Token.All }];
    s.subCategories = [{ Id: null, SubCategoryName: Token.All }];
    s.countries = [{ Id: null, CountryName: Token.All }];
    s.provinces = [{ Id: null, ProvinceName: Token.All }];

    //Get Ads
    s.getAds = reset => {
        if (reset) {
            s.ads = [];
            s.adsFilter.lastAdId = 0;
        }

        startBlock();
        service.getAds(s.adsFilter).then((d) => {
            debugger;
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        s.ads = s.ads.concat(d.data.Data);
                        s.adsFilter.lastAdId = s.ads[s.ads.length - 1].Id;
                    } break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message);
                    } break;

                case RequestType.Info:
                    {
                        toastr.info(d.data.Message);
                    } break;
            }
            co("R-getAds", d);
            stopBlock();
        }).catch((error) => {
            toastr.error(Token.someErrorHasBeen, Token.Error); co("Error getAds", error.data);
            stopBlock();
        });
    };

    s.getFilterItems = () => {
        startBlock();
        service.getFilterItems(s.adsFilter.ucerCreatedId).then((d) => {
            debugger;
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {

                        s.categories = s.categories.concat(d.data.Data.Categories);
                        s.subCategories = s.subCategories.concat(d.data.Data.SubCategories);
                        s.countries = s.countries.concat(d.data.Data.Countries);
                        s.provinces = s.provinces.concat(d.data.Data.Provinces);

                        if (s.adsFilter.ucerCreatedId && !d.data.Data.CurrentUserInformation)
                            toastr.error(langIsEn ? "User Not Found" : "المستخدم ليس موجود");
                        s.currentUserInfo = d.data.Data.CurrentUserInformation;

                    } break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message);
                    } break;

                case RequestType.Info:
                    {
                        toastr.info(d.data.Message);
                    } break;
            }
            co("R-getAds", d);
            stopBlock();
        }).catch((error) => {
            toastr.error(Token.someErrorHasBeen, Token.Error); co("Error getAds", error.data);
            stopBlock();
        });
    };

    s.getAdDetails = (ad) => {
        if (ad.AdDetails) {
            ad.Show = true;
            return;
        }
        startBlock();
        service.getAdDetails(ad.Id).then((d) => {
            debugger;
            switch (d.data.RequestType) {
                case RequestType.Success:
                    {
                        ad.AdDetails = d.data.Data;
                        ad.Show = true;

                    } break;
                case RequestType.Error:
                    {
                        toastr.error(d.data.Message);
                    } break;

                case RequestType.Info:
                    {
                        toastr.info(d.data.Message);
                    } break;
            }
            co("R-getAdDetails", d);
            stopBlock();
        }).catch((error) => {
            toastr.error(Token.someErrorHasBeen, Token.Error); co("Error getAdDetails", error.data);
            stopBlock();
        });
    };

    s.deleteAd = (ad) => {
        var conf = confirm(langIsEn ? "Are You Shure?" : "هل انت متاكد من حذف الاعلان ؟")
        if (conf) {
            startBlock();
            service.deleteAd(ad.Id).then((d) => {
                switch (d.data.RequestType) {
                    case RequestType.Success:
                        {
                            s.ads.splice(s.ads.findIndex(c=> c.Id == ad.Id), 1);
                            s.filter();
                            toastr.success(d.data.Message);
                        } break;
                    case RequestType.Error:
                        {
                            toastr.error(d.data.Message);
                        } break;

                    case RequestType.Info:
                        {
                            toastr.info(d.data.Message);
                        } break;
                }
                co("R-deleteAd", d);
                stopBlock();
            }).catch((error) => {
                toastr.error(Token.someErrorHasBeen, Token.Error); co("Error deleteAd", error.data);
                stopBlock();
            });
        }

    };



    s.getDataMore = () => {
        s.getAds();
    };
    s.getAds();
    s.getFilterItems();
    


    $(window).on('beforeunload', function () {
        if (s.RowUpdateBackup || s.country.NameEn || s.country.NameAr)
            return "";
    });
}]);