#!/bin/bash

echo "🚀 Starting comprehensive test suite for University Matching System..."
echo "================================================================"

# Function to run backend tests
run_backend_tests() {
    echo ""
    echo "🧪 Running Backend Tests..."
    echo "=========================="
    cd university-matching-backend
    
    # Check if Python is available
    if ! command -v python3 &> /dev/null; then
        echo "❌ Python3 is not installed or not in PATH"
        return 1
    fi
    
    # Install dependencies and run tests
    echo "📦 Installing Python dependencies..."
    python3 -m pip install -r requirements.txt
    
    echo "🧪 Running backend tests..."
    python3 run_tests.py
    
    cd ..
    echo "✅ Backend tests completed!"
}

# Function to run frontend tests
run_frontend_tests() {
    echo ""
    echo "🧪 Running Frontend Tests..."
    echo "==========================="
    cd university-matching-frontend
    
    # Check if Node.js is available
    if ! command -v node &> /dev/null; then
        echo "❌ Node.js is not installed or not in PATH"
        return 1
    fi
    
    # Install dependencies and run tests
    echo "📦 Installing Node.js dependencies..."
    npm install
    
    echo "🧪 Installing test dependencies..."
    npm install --save-dev @testing-library/react @testing-library/jest-dom @testing-library/user-event jest jest-environment-jsdom @types/jest
    
    echo "🧪 Running frontend tests..."
    npm test
    
    cd ..
    echo "✅ Frontend tests completed!"
}

# Main execution
echo "🔍 Checking system requirements..."

# Check if both directories exist
if [ ! -d "university-matching-backend" ]; then
    echo "❌ Backend directory not found!"
    exit 1
fi

if [ ! -d "university-matching-frontend" ]; then
    echo "❌ Frontend directory not found!"
    exit 1
fi

echo "✅ Project structure verified"

# Run backend tests
if run_backend_tests; then
    echo "✅ Backend tests passed"
else
    echo "❌ Backend tests failed"
    BACKEND_FAILED=true
fi

# Run frontend tests
if run_frontend_tests; then
    echo "✅ Frontend tests passed"
else
    echo "❌ Frontend tests failed"
    FRONTEND_FAILED=true
fi

# Summary
echo ""
echo "================================================================"
echo "📊 Test Summary:"
echo "================================================================"

if [ "$BACKEND_FAILED" = true ]; then
    echo "❌ Backend: FAILED"
else
    echo "✅ Backend: PASSED"
fi

if [ "$FRONTEND_FAILED" = true ]; then
    echo "❌ Frontend: FAILED"
else
    echo "✅ Frontend: PASSED"
fi

if [ "$BACKEND_FAILED" = true ] || [ "$FRONTEND_FAILED" = true ]; then
    echo ""
    echo "❌ Some tests failed. Please check the output above for details."
    exit 1
else
    echo ""
    echo "🎉 All tests passed successfully!"
    exit 0
fi