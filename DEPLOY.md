# دليل النشر على Firebase Hosting

## المتطلبات الأساسية

1. **تثبيت Firebase CLI** (إذا لم يكن مثبتاً):
```bash
npm install -g firebase-tools
```

2. **تسجيل الدخول إلى Firebase**:
```bash
firebase login
```

## خطوات النشر

### 1. إنشاء مشروع Firebase (إذا لم يكن موجوداً)

1. اذهب إلى [Firebase Console](https://console.firebase.google.com/)
2. اضغط على "Add project" أو "إضافة مشروع"
3. أدخل اسم المشروع (مثلاً: `abshr-app`)
4. اتبع التعليمات لإكمال إنشاء المشروع

### 2. تهيئة Firebase Hosting

```bash
firebase init hosting
```

عند السؤال:
- **Select an existing project**: اختر المشروع الذي أنشأته
- **What do you want to use as your public directory?**: `build/web`
- **Configure as a single-page app?**: `Yes`
- **Set up automatic builds and deploys with GitHub?**: `No` (يمكنك تفعيله لاحقاً)

### 3. تحديث معرف المشروع

افتح ملف `.firebaserc` واستبدل `your-project-id` بمعرف مشروعك الفعلي:

```json
{
  "projects": {
    "default": "your-actual-project-id"
  }
}
```

### 4. بناء التطبيق

```bash
flutter build web --release
```

### 5. النشر على Firebase

```bash
firebase deploy --only hosting
```

## النشر التلقائي (اختياري)

يمكنك إضافة سكريبت في `package.json` أو استخدام GitHub Actions للنشر التلقائي عند كل commit.

## الوصول للتطبيق

بعد النشر، ستحصل على رابط مثل:
```
https://your-project-id.web.app
```
أو
```
https://your-project-id.firebaseapp.com
```

## تحديث التطبيق

عندما تريد تحديث التطبيق:

1. قم بتعديل الكود
2. شغل: `flutter build web --release`
3. شغل: `firebase deploy --only hosting`

## ملاحظات مهمة

- تأكد من أن `build/web` موجود قبل النشر
- يمكنك اختبار التطبيق محلياً باستخدام: `firebase serve`
- جميع الملفات في `build/web` ستُرفع إلى Firebase Hosting


