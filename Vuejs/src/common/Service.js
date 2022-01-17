import axios from 'axios';
import { MAIN_URL } from '@/common/Url';
export function userLogin(data) {
    return axios.post(`${MAIN_URL}login`, data)
}
export function userRegister(data) {
    return axios.post(`${MAIN_URL}register`, data)
}
export function contact(data) {
    return axios.post(`${MAIN_URL}contact`, data)
}
export function banner() {
    return axios.get(`${MAIN_URL}banners`)
}
export function products() {
    return axios.get(`${MAIN_URL}products`)//main
} export function categories() {
    return axios.get(`${MAIN_URL}categories`)// sidebar
}
export function categoryProduct(id) {
    return axios.get(`${MAIN_URL}categories/${id}`)//home
}
export function productDetails(id) {
    return axios.get(`${MAIN_URL}products/${id}`);//productdetails
}
export function userDetails(id) {
    return axios.get(`${MAIN_URL}user/${id}`)
}
export function updateUser(id, data) {
    return axios.put(`${MAIN_URL}user/${id}`, data)
}
export function changePassword(id, data) {
    return axios.put(`${MAIN_URL}password/${id}`, data);
}
export function wishlist(data) {
    return axios.post(`${MAIN_URL}wishlist`, data);
}
export function getWishlist(id) {
    return axios.get(`${MAIN_URL}wishlist/${id}`);
}
export function deletewishlist(id) {
    return axios.delete(`${MAIN_URL}wishlist/${id}`);
}
export function coupon() {
    return axios.get(`${MAIN_URL}getcoupons`);
}
export function userOrder(data) {
    return axios.post(`${MAIN_URL}userorder`, data);
}
export function userAddress(data) {
    return axios.post(`${MAIN_URL}address`, data);
}
export function myOrder(id) {
    return axios.get(`${MAIN_URL}userorder/${id}`);
}
export function CMS() {
    return axios.get(`${MAIN_URL}displaycms`);
}
export function cmsById(id) {
    return axios.get(`${MAIN_URL}displaycms/${id}`);
}
export function configuration() {
    return axios.get(`${MAIN_URL}displayconfiguration`);
}
export function subscriber(data) {
    return axios.post(`${MAIN_URL}subscribe`,data);
}
export default {
    userLogin, userRegister, contact, banner, products, categories, categoryProduct, productDetails,
    userDetails, updateUser, wishlist, getWishlist, deletewishlist, userOrder,subscriber, userAddress, myOrder, CMS, cmsById, configuration
};