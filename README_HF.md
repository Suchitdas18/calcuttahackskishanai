---
title: WheatGuard AI API
emoji: 🌾
colorFrom: green
colorTo: emerald
sdk: docker
pinned: false
license: mit
---

# 🌾 WheatGuard AI - Wheat Disease Detection API

An AI-powered API for detecting diseases in wheat plants using deep learning.

## Features

- **Real-time Disease Detection**: Upload wheat leaf images for instant AI analysis
- **4 Disease Classifications**: 
  - Crown and Root Rot
  - Healthy Wheat
  - Leaf Rust
  - Wheat Loose Smut
- **High Accuracy**: 93%+ prediction accuracy using EfficientNetV2B2 model
- **RESTful API**: Easy integration with any frontend

## API Endpoints

### Health Check
```bash
GET /health
```

Returns API health status and model loading state.

### Predict Disease
```bash
POST /api/predict
```

Upload an image file to get disease prediction.

**Request:**
- Method: POST
- Content-Type: multipart/form-data
- Body: `file` (image file - JPG, PNG, JPEG)

**Response:**
```json
{
  "label": "Healthy Wheat",
  "confidence": 0.95
}
```

## Usage Example

```python
import requests

url = "https://your-space-name.hf.space/api/predict"
files = {"file": open("wheat_image.jpg", "rb")}

response = requests.post(url, files=files)
result = response.json()

print(f"Prediction: {result['label']}")
print(f"Confidence: {result['confidence']:.2%}")
```

## Model Details

- **Architecture**: EfficientNetV2B2
- **Input Size**: 260×260×3
- **Framework**: TensorFlow/Keras
- **Training Dataset**: Curated wheat disease images

## Technology Stack

- **Backend**: Flask + Gunicorn
- **ML Framework**: TensorFlow 2.x
- **Image Processing**: OpenCV, PIL, NumPy
- **Deployment**: Docker on Hugging Face Spaces

## Links

- **Frontend**: [Vercel Deployment](https://your-frontend-url.vercel.app)
- **GitHub**: [Source Code](https://github.com/Suchitdas18/calcuttahackskishanai)

## License

MIT License - See LICENSE file for details

---

**Built for the Calcutta Hacks Hackathon** 🚀
