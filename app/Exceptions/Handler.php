<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @return void
     */
    public function report(Throwable $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function render($request, Throwable $exception)
    {
        $this->renderable(function (NotFoundHttpException $e, $request) {
            if ($request->is('api/*')) {
                $message = "This api route not found!";
                return response()->json(['success' => false, 'exception_type' => 'not_found_http', 'message' => $message], 404);
            }
        });
        $this->renderable(function (ModelNotFoundException $e, $request) {
            if ($request->is('api/*')) {
                $message = "Record not found!";
                return response()->json(['success' => false, 'exception_type' => 'model_not_found', 'message' => $message], 404);
            }
        });
        $this->renderable(function (AuthenticationException $e, $request) {
            if ($request->is('api/*')) {
                return response()->json(['success' => false, 'exception_type' => 'unthenticated', 'message' => 'Unauthenticated'], 401);
            }
        });
        $this->renderable(function (ValidationException $e, $request) {
            if ($request->is('api/*')) {
                return response()->json(['success' => false, 'exception_type' => 'validation', 'message' => $e->getMessage(), 'lineno' => $e->getLine()], 422);
            }
        });
        $this->renderable(function (QueryException $e, $request) {
            if ($request->is('api/*')) {
                return response()->json(['success' => false, 'exception_type' => 'query_exception', 'message' => $e->getMessage(), 'lineno' => $e->getLine() ], 500);
            }
        });
        $this->renderable(function (MethodNotAllowedHttpException $e, $request) {
            if ($request->is('api/*')) {
                return response()->json(['success' => false, 'exception_type' => 'method_not_found', 'message' => $e->getMessage(), 'lineno' => $e->getLine() ], 500);
            }
        });
        $this->renderable(function (Exception $e, $request) {
            if ($request->is('api/*')) {
                return response()->json(['success' => false, 'exception_type' => 'exception', 'message' => $e->getMessage(), 'lineno' => $e->getLine() ], 500);
            }
        });
        $this->renderable(function (Throwable $e, $request) {
            if ($request->is('api/*')) {
                return response()->json(['success' => false, 'exception_type' => 'throwable', 'message' => $e->getMessage(), 'lineno' => $e->getLine() ], 500);
            }
        });
        return parent::render($request, $exception);
    }
}
