# Testing Setup for University Matching System

This document explains how to set up and run tests for both the frontend and backend components of the University Matching System.

## 🏗️ Project Structure

```
mom/
├── university-matching-backend/     # FastAPI backend
│   ├── tests/                      # Backend tests
│   ├── requirements.txt            # Python dependencies
│   ├── pytest.ini                 # Pytest configuration
│   └── run_tests.py               # Backend test runner
├── university-matching-frontend/    # Next.js frontend
│   ├── tests/                     # Frontend tests
│   ├── package.json               # Node.js dependencies
│   ├── jest.config.js             # Jest configuration
│   ├── jest.setup.js              # Jest setup
│   └── run_tests.sh               # Frontend test runner
└── run_all_tests.sh               # Master test runner
```

## 🚀 Quick Start

### Run All Tests (Recommended)
```bash
./run_all_tests.sh
```

This script will:
1. Check system requirements
2. Install dependencies for both projects
3. Run backend tests
4. Run frontend tests
5. Provide a comprehensive summary

### Run Tests Individually

#### Backend Tests Only
```bash
cd university-matching-backend
python3 run_tests.py
```

#### Frontend Tests Only
```bash
cd university-matching-frontend
./run_tests.sh
```

## 🧪 Backend Testing (FastAPI)

### Dependencies
- Python 3.8+
- pytest
- pytest-asyncio
- pytest-cov
- httpx

### Test Structure
- **Unit Tests**: Test individual functions and models
- **Integration Tests**: Test API endpoints and database interactions
- **API Tests**: Test HTTP endpoints with mocked dependencies

### Running Backend Tests
```bash
cd university-matching-backend

# Install dependencies
python3 -m pip install -r requirements.txt

# Run tests with coverage
python3 -m pytest tests/ -v --cov=. --cov-report=term-missing

# Run specific test file
python3 -m pytest tests/test_main.py -v

# Run tests with HTML coverage report
python3 -m pytest tests/ --cov=. --cov-report=html
```

### Backend Test Files
- `tests/test_main.py` - Main application tests
- `tests/test_models.py` - Pydantic model tests
- `tests/conftest.py` - Test fixtures and configuration

## 🎨 Frontend Testing (Next.js)

### Dependencies
- Node.js 18+
- Jest
- @testing-library/react
- @testing-library/jest-dom
- @testing-library/user-event

### Test Structure
- **Component Tests**: Test React components in isolation
- **API Tests**: Test API utility functions
- **Integration Tests**: Test component interactions

### Running Frontend Tests
```bash
cd university-matching-frontend

# Install dependencies
npm install

# Run tests
npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:coverage
```

### Frontend Test Files
- `tests/lib/api.test.ts` - API utility function tests
- `tests/components/` - Component tests (to be expanded)

## 📊 Coverage Reports

### Backend Coverage
- Coverage reports are generated in HTML format
- View by opening `university-matching-backend/htmlcov/index.html` in your browser
- Terminal output shows line-by-line coverage

### Frontend Coverage
- Coverage reports are generated in the `coverage/` directory
- View by opening `coverage/lcov-report/index.html` in your browser
- Coverage thresholds are set to 70% for all metrics

## 🔧 Configuration

### Backend (pytest.ini)
- Test discovery patterns
- Coverage settings
- Custom markers for test categorization

### Frontend (jest.config.js)
- Next.js integration
- Test environment setup
- Coverage thresholds
- Module path mapping

## 🐛 Troubleshooting

### Common Issues

#### Backend Tests
1. **Import Errors**: Ensure you're in the correct directory
2. **Database Connection**: Tests use mocked database connections
3. **Dependencies**: Run `pip install -r requirements.txt`

#### Frontend Tests
1. **Module Resolution**: Check Jest configuration
2. **React Version**: Ensure compatibility with testing libraries
3. **Dependencies**: Run `npm install` to install all packages

### Debug Mode
```bash
# Backend with verbose output
python3 -m pytest tests/ -v -s

# Frontend with verbose output
npm test -- --verbose
```

## 📝 Adding New Tests

### Backend Tests
1. Create test files in `tests/` directory
2. Use `test_` prefix for test functions
3. Import fixtures from `conftest.py`
4. Use appropriate markers (`@pytest.mark.unit`, `@pytest.mark.integration`)

### Frontend Tests
1. Create test files in `tests/` directory
2. Use `describe` and `it` blocks for test organization
3. Import testing utilities from `@testing-library/*`
4. Mock external dependencies appropriately

## 🎯 Best Practices

1. **Test Isolation**: Each test should be independent
2. **Mocking**: Mock external services and databases
3. **Coverage**: Aim for high test coverage
4. **Naming**: Use descriptive test names
5. **Organization**: Group related tests logically

## 📚 Additional Resources

- [FastAPI Testing](https://fastapi.tiangolo.com/tutorial/testing/)
- [Jest Documentation](https://jestjs.io/docs/getting-started)
- [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/)
- [Pytest Documentation](https://docs.pytest.org/)

## 🤝 Contributing

When adding new features:
1. Write tests first (TDD approach)
2. Ensure all tests pass
3. Maintain or improve coverage
4. Update this documentation if needed