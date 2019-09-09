/// <reference path="../../Shared/Module.js" />
myApp.service("serviceAds", ["$http", function (h) {
    var controller = "/Ads/",
        functions = {

            //Get Ads
            getAds(filter) {
                return h({
                    method: 'Get',
                    url: `${controller}GetAds?LastAdId=${filter.lastAdId}&Take=${filter.take}&CategoryId=${filter.categoryId}&SubCategoryId=${filter.subCategoryId}&CountryId=${filter.countryId}&ProvinceId=${filter.provinceId}&Title=${filter.title}&UcerCreatedId=${filter.ucerCreatedId}`,
                });
            },

            getFilterItems(userId) {
                return h({
                    method: 'get',
                    url: `${controller}getFilterItems?userId=${userId}`,
                });
            },

            getAdDetails(adId) {
                return h({
                    method: 'get',
                    url: `${controller}getAdDetails?adId=` + adId,
                });
            },

            deleteAd(adId) {
                return h({
                    method: 'get',
                    url: `${controller}deleteAd?adId=` + adId,
                });
            }


        };
    return functions;
}]);