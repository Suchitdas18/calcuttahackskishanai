# 🚀 Deployment Guide - WheatGuard AI

## 📋 Overview

Your WheatGuard AI application consists of two parts:
1. **Backend API** (Flask + TensorFlow) - Deploy to Render
2. **Frontend** (React + Vite) - Deploy to Vercel

Repository: https://github.com/Suchitdas18/calcuttahackskishanai

---

## 🔧 Part 1: Deploy Backend to Render

### Step 1: Create Render Account
1. Go to [render.com](https://render.com)
2. Sign up with GitHub

### Step 2: Deploy the Flask API

1. **Click "New +" → "Web Service"**

2. **Connect GitHub Repository:**
   - Select: `Suchitdas18/calcuttahackskishanai`
   - Click "Connect"

3. **Configure the Service:**
   ```
   Name: wheat-guard-api
   Region: Oregon (US West)
   Branch: main
   Root Directory: (leave empty)
   Runtime: Python 3
   Build Command: pip install -r requirements.txt
   Start Command: gunicorn src.app:app --bind 0.0.0.0:$PORT
   ```

4. **Select Plan:**
   - Choose "Free" plan

5. **Environment Variables:**
   Add these env vars:
   ```
   PYTHON_VERSION = 3.10.12
   PORT = 8000
   ```

6. **Click "Create Web Service"**

7. **Wait for deployment** (5-10 minutes for first deploy due to TensorFlow)

8. **Your API URL will be:**
   ```
   https://wheat-guard-api.onrender.com
   ```

9. **Test the API:**
   - Visit: `https://wheat-guard-api.onrender.com/health`
   - Should return: `{"status":"healthy","model_loaded":true}`

---

## 🌐 Part 2: Deploy Frontend to Vercel

### Option A: Using Vercel Dashboard (Recommended)

1. **Go to [vercel.com](https://vercel.com)**
2. **Sign in with GitHub**

3. **Import Project:**
   - Click "Add New..." → "Project"
   - Select: `Suchitdas18/calcuttahackskishanai`
   - Click "Import"

4. **Configure Project:**
   ```
   Framework Preset: Vite
   Root Directory: src/web
   Build Command: npm run build
   Output Directory: dist
   Install Command: npm install
   ```

5. **Environment Variables:**
   Add this variable:
   ```
   VITE_API_URL = https://wheat-guard-api.onrender.com
   ```
   ⚠️ **IMPORTANT:** Replace with your actual Render URL from Step 1!

6. **Click "Deploy"**

7. **Your app will be live at:**
   ```
   https://calcuttahackskishanai.vercel.app
   ```
   (or similar Vercel URL)

### Option B: Using Vercel CLI

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
cd src/web
vercel --prod

# Follow the prompts and set:
# - Framework: Vite
# - Build Command: npm run build
# - Output Directory: dist
# - Environment Variable: VITE_API_URL=https://wheat-guard-api.onrender.com
```

---

## ✅ Verification

### Test Backend:
```bash
curl https://wheat-guard-api.onrender.com/health
```

Expected Response:
```json
{
  "status": "healthy",
  "model_loaded": true
}
```

### Test Frontend:
1. Open your Vercel URL in browser
2. You should see "SYSTEM ONLINE" in top right
3. Try uploading a wheat image
4. Should get disease prediction results

---

## 🔄 Future Updates

### Update Backend:
```bash
# Make changes to backend code
git add .
git commit -m "Update backend"
git push

# Render will auto-deploy
```

### Update Frontend:
```bash
# Make changes to frontend code in src/web/
git add .
git commit -m "Update frontend"
git push

# Vercel will auto-deploy
```

---

## 🐛 Troubleshooting

### Backend Issues:

**"Model not loading"**
- Check Render logs for memory issues
- Free tier has 512MB RAM limit
- Model file size: Check if flagship_model.keras was pushed to Git

**"Build fails"**
- Check requirements.txt compatibility
- Verify Python version is 3.10+

### Frontend Issues:

**"Analysis failed" error**
- Check if VITE_API_URL environment variable is set correctly
- Verify backend is deployed and healthy
- Check browser console for CORS errors

**"Can't connect to backend"**
- Ensure backend URL in VITE_API_URL doesn't have trailing slash
- Verify backend is awake (Render free tier sleeps after 15min inactivity)

---

## 📊 Deployment URLs

Once deployed, update these in your README:

```markdown
## 🌐 Live Demo

- **Backend API:** https://wheat-guard-api.onrender.com
- **Web Application:** https://calcuttahackskishanai.vercel.app
```

---

## 🎯 Post-Deployment Checklist

- [ ] Backend deployed to Render
- [ ] Backend health check passing
- [ ] Frontend deployed to Vercel
- [ ] Frontend shows "SYSTEM ONLINE"
- [ ] Can upload images successfully
- [ ] Predictions working correctly
- [ ] Updated README with live URLs
- [ ] Tested on mobile device

---

## 💡 Tips

1. **Render Free Tier:** Spins down after 15min inactivity. First request after spin-down takes ~30 seconds.

2. **Model File:** Ensure `src/models/flagship_model.keras` is in your GitHub repo (check .gitignore doesn't exclude it).

3. **CORS:** Already configured in Flask with `flask-cors`. Should work automatically.

4. **Environment Variables:** Frontend env vars must be prefixed with `VITE_` to work with Vite.

---

## 🆘 Need Help?

- **Render Docs:** https://render.com/docs
- **Vercel Docs:** https://vercel.com/docs
- **Check Logs:**
  - Render: Dashboard → Your Service → Logs
  - Vercel: Dashboard → Your Project → Deployments → View Function Logs

---

**Good luck with your deployment! 🚀🌾**
