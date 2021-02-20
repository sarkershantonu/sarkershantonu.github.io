https://docs.cypress.io/guides/core-concepts/writing-and-organizing-tests.html#Allowed-config-values

inject configuration for a test : 

```shell

it('should redirect unauthenticated user to sign-in page', {
    retries: {
      runMode: 3,
      openMode: 2
    }
  } () => {
    cy.visit('/')
    // ...
  })
})
```

inject configuration for a suite : 

```javaScript
describe('When in Firefox', {
  browser: 'firefox',
  viewportWidth: 1024,
  viewportHeight: 700,
  env: {
    DEMO: true,
    API: 'http://localhost:9000'
  }
}, () => {
  it('Sets the expected viewport and API url', () => {
    expect(cy.config('viewportWidth')).to.equal(1024)
    expect(cy.config('viewportHeight')).to.equal(700)
    expect(cy.env('API')).to.equal('http://localhost:9000')
  })
```


```
describe('When NOT in Chrome', { browser: '!chrome' }, () => {
  it('Shows warning', () => {
    cy.get('.browser-warning')
      .should('contain', 'For optimal viewing, use Chrome browser')
  })
```

https://docs.cypress.io/guides/guides/environment-variables.html#Setting